require 'csv'
require 'rails/all'

class Person < ActiveRecord::Base
  has_many :people_first_name_trigrams, dependent: :destroy
  has_many :people_last_name_trigrams, dependent: :destroy
  has_many :scans, order: 'scan_date DESC', dependent: :destroy
  has_many :person_notes, order: 'created_at DESC', dependent: :destroy
  belongs_to :user # user that created this person
  attr_accessible :first_name, :last_name
  validates :first_name, presence: true, length: { maximum: 64 }
  validates :last_name, presence: true, length: { maximum: 64 }

  after_save :handle_saved

  def self.search(first_name , last_name, is_fuzzy = false, include_nicknames = false)
    if last_name.nil? && first_name.nil?
      return includes(:scans).order(:last_name)
    end

    # handle fastest search with a special case
    if !is_fuzzy && !include_nicknames
      if !first_name.nil?
        if !last_name.nil?
          first_name.downcase!
          last_name.downcase!
          return includes(:scans).where("lower(first_name) like lower(:first_name) and lower(last_name) like lower(:last_name)",
                         {first_name: first_name + '%', last_name: last_name + '%'} )
        else
          first_name.downcase!
          return includes(:scans).where("lower(first_name) like lower(:search)", {search: first_name + '%'} ).order("char_length(first_name)")
        end
      else
        last_name.downcase!
        return includes(:scans).where("lower(last_name) like lower(:search)", {search: last_name + '%'} ).order("char_length(last_name)")
      end
    end

    people_by_first_name = []
    people_by_first_name_with_nicknames = []
    people_by_first_name_with_nicknames_fuzzy = []
    people_by_first_name_fuzzy = []
    people_by_last_name = []

    if !last_name.nil?
      last_name.downcase!
      people_by_last_name = includes(:scans).where("lower(last_name) like lower(:search)", {search: last_name + '%'} ).order("char_length(last_name)").to_a
      if is_fuzzy
        people_by_last_name |= get_fuzzy_last_name_matches(last_name)
      end
    end

    if !first_name.nil?
      first_name.downcase!
      people_by_first_name = includes(:scans).where("lower(first_name) like lower(:search)", {search: first_name + '%'} ).order("char_length(first_name)")
      if is_fuzzy
        people_by_first_name_fuzzy = get_fuzzy_first_name_matches(first_name)
      end

      if include_nicknames && first_name.length > 2
        first_names = []
        name_groups = []
        nicknames = Nickname.search(first_name, is_fuzzy)
        nicknames.each do |nickname|
          p nickname.name
          first_names_from_nicknames |= nickname.name
          name_groups |= [nickname.name_group]
        end

        first_names_from_nicknames = []
        name_groups.each do |name_group|
          first_names_from_nicknames |= name_group.names.split(',')
        end

        first_names_from_nicknames.each do |first_name_from_nicknames|
          people_by_first_name_with_nicknames |= includes(:scans).find_all_by_first_name(first_name_from_nicknames)
          if is_fuzzy
            people_by_first_name_with_nicknames_fuzzy |= get_fuzzy_first_name_matches(first_name_from_nicknames)
         end
        end
      end
    end

    result = nil
    if !first_name.nil?
      result = people_by_first_name |
          people_by_first_name_with_nicknames |
          people_by_first_name_fuzzy |
          people_by_first_name_with_nicknames_fuzzy
      if !last_name.nil?
        result &= people_by_last_name
      end
    else
      result = people_by_last_name
    end
    result
  end

  protected
  def handle_saved
    PeopleFirstNameTrigram.delete_all(:person_id => self.id)
    word = ' ' + self.first_name.downcase
    (0..word.length-3).each do |idx|
      tg = word[idx,3]
      self.people_first_name_trigrams.create(tg: tg);
    end

    PeopleLastNameTrigram.delete_all(:person_id => self.id)
    word = ' ' + self.last_name.downcase
    (0..word.length-3).each do |idx|
      tg = word[idx,3]
      self.people_last_name_trigrams.create(tg: tg);
    end
  end

  private
  def self.get_fuzzy_first_name_matches(first_name)
    first_name = " #{first_name} "
    limit = 20
    trigram_list = (0..first_name.length-3).collect { |idx| first_name[idx,3] }
    sql = 'select *
           from people
           inner join(
             select person_id, count(person_id) as score
             from people_first_name_trigrams
             where tg in (?)
             group by person_id
             having count(person_id) > 2
             order by score desc
             limit ' + limit.to_s + ') as scored_person_first_names
           on people.id = scored_person_first_names.person_id'
    people = Person.includes(:scans)
    people = people.find_by_sql([sql, trigram_list])
    people
  end

  def self.get_fuzzy_last_name_matches(last_name)
    last_name = " #{last_name} "
    limit = 20
    trigram_list = (0..last_name.length-3).collect { |idx| last_name[idx,3] }
    sql = 'select *
           from people
           inner join(
             select person_id, count(person_id) as score
             from people_last_name_trigrams
             where tg in (?)
             group by person_id
             having count(person_id) > 2
             order by score desc
             limit ' + limit.to_s + ') as scored_person_last_names
           on people.id = scored_person_last_names.person_id'
    people = Person.includes(:scans)
    people = people.find_by_sql([sql, trigram_list])
    people
  end

  def self.to_csv
    CSV.generate do |csv|
        csv <<  ["First Name", "Last Name", "Date Added", "Added By", "Date of Last Scan"]
        all.each do |person|
        scans = person.scans
        csv << [person.first_name,
                      person.last_name,
                      person.created_at.to_date,
                      person.user.name.nil? ? person.user.email : person.user.name,
                      scans.count > 0 ? scans.first.scan_date.to_date : 'NO SCAN!']
      end
    end
  end

end
