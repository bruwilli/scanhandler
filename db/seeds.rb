# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end

puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.confirm!
user.add_role :admin

puts 'NAME GROUPS'
NameGroup.create!(names: 'aaron,ron')
NameGroup.create!(names: 'abel,abe')
NameGroup.create!(names: 'abednego,bedney')
NameGroup.create!(names: 'abijah,ab,bige')
NameGroup.create!(names: 'abigail,ab,abbie,abby,gail')
NameGroup.create!(names: 'abner,ab,abbie,abby')
NameGroup.create!(names: 'abraham,abe,abram,bram')
NameGroup.create!(names: 'absalom,ab,abbie,app')
NameGroup.create!(names: 'adaline,ada,adela,aline,edith')
NameGroup.create!(names: 'adam,ade,edie')
NameGroup.create!(names: 'addy,ad')
NameGroup.create!(names: 'adelaide,ada,addie,adela,adeline,della,heide')
NameGroup.create!(names: 'adela,della')
NameGroup.create!(names: 'adelaide,addie')
NameGroup.create!(names: 'adelbert,albert,del,delbert,bert')
NameGroup.create!(names: 'adeline,addie,linney')
NameGroup.create!(names: 'adolphus,ado,adolph,dolph')
NameGroup.create!(names: 'adrian,rian')
NameGroup.create!(names: 'adrienne,adrian')
NameGroup.create!(names: 'agatha,addy,ag,aggie,agnes')
NameGroup.create!(names: 'agnes,aggy,ann,nancy,nessie')
NameGroup.create!(names: 'aileen,helen')
NameGroup.create!(names: 'alanson,al,lanson')
NameGroup.create!(names: 'alastair,al')
NameGroup.create!(names: 'alazama,ali')
NameGroup.create!(names: 'albert,al,bert,bird,alberta')
NameGroup.create!(names: 'alberta,abertina,albertine,allie,bert,bertie,albert')
NameGroup.create!(names: 'aleva,leve,levy')
NameGroup.create!(names: 'alexander,ala,alec,alex,andi,ec,lex,sandy,xandra,alexis,sandra')
NameGroup.create!(names: 'alexandra,lexa,xan')
NameGroup.create!(names: 'alexandria,alla,drina,sandra,alexander')
NameGroup.create!(names: 'alexandria,alla,ellie,elic')
NameGroup.create!(names: 'alexis,lexi')
NameGroup.create!(names: 'alfred,al,alf,alfie,fred,alfreda')
NameGroup.create!(names: 'alfreda,alfy,frieda,alfred')
NameGroup.create!(names: 'algernon,algy')
NameGroup.create!(names: 'alicia,ally')
NameGroup.create!(names: 'alice,alcy,alicia,allie,elsie,lisa')
NameGroup.create!(names: 'aline,adeline')
NameGroup.create!(names: 'alison,ali')
NameGroup.create!(names: 'almena,allie,mena')
NameGroup.create!(names: 'almina,minnie')
NameGroup.create!(names: 'alonzo,al,alphonzo,lon,lonnie,lonzo')
NameGroup.create!(names: 'alphinias,alphus')
NameGroup.create!(names: 'almira,myra')
NameGroup.create!(names: 'alverta,vert,virdie')
NameGroup.create!(names: 'alyssa,al,ally,lissia')
NameGroup.create!(names: 'alzada,zada')
NameGroup.create!(names: 'amanda,amy,manda,mandana,mandy')
NameGroup.create!(names: 'ambrose,brose')
NameGroup.create!(names: 'amelia,amy,emily,mel,melia,millie')
NameGroup.create!(names: 'amos,moses')
NameGroup.create!(names: 'anastasia,ana,stacy')
NameGroup.create!(names: 'andrea,andrew,drea,rea')
NameGroup.create!(names: 'andrew,andy,ansey,drew,andrea')
NameGroup.create!(names: 'angela,angel,angelica,angelina,angeline,angie,jane')
NameGroup.create!(names: 'angelina,lina')
NameGroup.create!(names: 'anna,anne,annie,ann')
NameGroup.create!(names: 'anne,annie,ann')
NameGroup.create!(names: 'annie,ann,anna')
NameGroup.create!(names: 'annette,anna,nettie')
NameGroup.create!(names: 'anselm,anse,ance,ansel,selma')
NameGroup.create!(names: 'anthony,tony,antoinette,antonia')
NameGroup.create!(names: 'antoinette,antonia,net,nettie,tonie')
NameGroup.create!(names: 'antonia,nettie,antone,anthony')
NameGroup.create!(names: 'appoline,appie,appy')
NameGroup.create!(names: 'aquilla,quil,quillie')
NameGroup.create!(names: 'arabella,ara,bella,belle')
NameGroup.create!(names: 'araminta,armida,middie,minty,ruminta')
NameGroup.create!(names: 'archibald,archie,baldie')
NameGroup.create!(names: 'ariadne,arie')
NameGroup.create!(names: 'arielle,arie')
NameGroup.create!(names: 'archilles,kill,killis')
NameGroup.create!(names: 'aristotle,telly')
NameGroup.create!(names: 'arizona,ona,onie')
NameGroup.create!(names: 'arlene,lena')
NameGroup.create!(names: 'armanda,mandy')
NameGroup.create!(names: 'armilda,milly')
NameGroup.create!(names: 'arminda,mindie')
NameGroup.create!(names: 'arminta,minite,minnie')
NameGroup.create!(names: 'arnold,arnie')
NameGroup.create!(names: 'artelepsa,epsey')
NameGroup.create!(names: 'artemus,art')
NameGroup.create!(names: 'arthur,art')
NameGroup.create!(names: 'arthusa,thursa')
NameGroup.create!(names: 'arzada,zaddi')
NameGroup.create!(names: 'aubrey,bree')
NameGroup.create!(names: 'audrey,dee')
NameGroup.create!(names: 'augusta,aggy,augie,gus,guss,gussie')
NameGroup.create!(names: 'augustina,aggy,augie,gus,guss,gussie,ina,tina,augustus')
NameGroup.create!(names: 'augustine,aggy,augie,gus,guss,gussie,ina,tina,augustus')
NameGroup.create!(names: 'augustus,gus,gustus,augusta,gustie')
NameGroup.create!(names: 'aurelia,aurilla,orilla,ora,ree,rilly')
NameGroup.create!(names: 'avarilla,rilla')
NameGroup.create!(names: 'barbara,babs,barb,barbie,barby,bobbie,bonnie')
NameGroup.create!(names: 'barbery,barbara')
NameGroup.create!(names: 'barnabas,barney')
NameGroup.create!(names: 'bernard,barney,bernie')
NameGroup.create!(names: 'bartholomew,bart,bartel,barth,bat')
NameGroup.create!(names: 'barticus,bart')
NameGroup.create!(names: 'bazaleel,basil')
NameGroup.create!(names: 'beatrice,bea,trisha,trissy,trixie')
NameGroup.create!(names: 'bedelia,delia,bridgit')
NameGroup.create!(names: 'belinda,bell,belle,linda')
NameGroup.create!(names: 'benedict,bennett')
NameGroup.create!(names: 'benjamin,ben,benjie,bennie,jamie')
NameGroup.create!(names: 'bertram,bert')
NameGroup.create!(names: 'bertha,bertie')
NameGroup.create!(names: 'bethena,beth,thaney')
NameGroup.create!(names: 'beverly,bev')
NameGroup.create!(names: 'bezaleel,zeely')
NameGroup.create!(names: 'blanche,bea')
NameGroup.create!(names: 'boetius,bo')
NameGroup.create!(names: 'brenda,brandy')
NameGroup.create!(names: 'bridget,biddy,bridie,brie,delia')
NameGroup.create!(names: 'brian,bryan,bryant')
NameGroup.create!(names: 'brittany,britt')
NameGroup.create!(names: 'caldonia,calliedona')
NameGroup.create!(names: 'caleb,cal')
NameGroup.create!(names: 'california,callie')
NameGroup.create!(names: 'calista,kissy')
NameGroup.create!(names: 'calpurnia,cally')
NameGroup.create!(names: 'calvin,cal')
NameGroup.create!(names: 'cameron,cam')
NameGroup.create!(names: 'camille,cammy,millie')
NameGroup.create!(names: 'campbell,cam')
NameGroup.create!(names: 'candace,candy,dacey')
NameGroup.create!(names: 'carlotta,lottie')
NameGroup.create!(names: 'carlton,carl')
NameGroup.create!(names: 'carmon,carm,cammie,charm')
NameGroup.create!(names: 'carmellia,mellia')
NameGroup.create!(names: 'caroline,caddie,carol,carrie,cassie,lena,lynn')
NameGroup.create!(names: 'carolyn,caddie,carol,carrie,cassie,lena,lynn')
NameGroup.create!(names: 'carthaette,etta,etty')
NameGroup.create!(names: 'casper,jasper')
NameGroup.create!(names: 'cassandra,cass,cassie,cassey,sandi,sandra')
NameGroup.create!(names: 'caswell,cass')
NameGroup.create!(names: 'catherine,cathy,karen,katharine,katie,kathleen,kay,kit,kittie')
NameGroup.create!(names: 'cathleen,catherine')
NameGroup.create!(names: 'cecilia,celia,cissy,cecil')
NameGroup.create!(names: 'celeste,celia,lessie')
NameGroup.create!(names: 'celinda,linda,lindy,lynn')
NameGroup.create!(names: 'charity,chat')
NameGroup.create!(names: 'charles,buck,carl,chad,charlie')
NameGroup.create!(names: 'chick,chuck,caroline,charlotte')
NameGroup.create!(names: 'charlotte,car,carlotta,letty,lotta,lottie,charles')
NameGroup.create!(names: 'chauncey,chance')
NameGroup.create!(names: 'chesley,chet')
NameGroup.create!(names: 'chester,chet')
NameGroup.create!(names: 'chloe,clo')
NameGroup.create!(names: 'christian,chris,christopher,kit')
NameGroup.create!(names: 'christine,christiana,chris,crissy,christy,ina,tina,xina')
NameGroup.create!(names: 'christopher,chris,christian,kester,kit')
NameGroup.create!(names: 'cicely,cilla')
NameGroup.create!(names: 'cinderella,arilla,cindy,rilla,rella')
NameGroup.create!(names: 'clara,claire,clarice,clarissa')
NameGroup.create!(names: 'clarence,clay')
NameGroup.create!(names: 'clarinda,clara,clarence,renee')
NameGroup.create!(names: 'clarissa,clara,clare,cissy')
NameGroup.create!(names: 'claudia,claud')
NameGroup.create!(names: 'cleatus,cleat')
NameGroup.create!(names: 'clementine,clem,clement')
NameGroup.create!(names: 'clifford,cliff,ford')
NameGroup.create!(names: 'clifton,cliff')
NameGroup.create!(names: 'cole,colie')
NameGroup.create!(names: 'columbus,lum')
NameGroup.create!(names: 'constance,connie,constant')
NameGroup.create!(names: 'cordelia,cordy,delia')
NameGroup.create!(names: 'cory,coco,cordy,ree')
NameGroup.create!(names: 'corey,coco,cordy,ree')
NameGroup.create!(names: 'corinne,cora,ora')
NameGroup.create!(names: 'cornelia,conny,corny,neely,nelle,nelly,cornelius')
NameGroup.create!(names: 'cornelius,neil,neely,cornelia')
NameGroup.create!(names: 'courtney,corky,court,curt')
NameGroup.create!(names: 'crystal,chris,crys,tal,stal')
NameGroup.create!(names: 'cynthia,cindy,sina')
NameGroup.create!(names: 'cyrus,cy')
NameGroup.create!(names: 'daisy,margaret')
NameGroup.create!(names: 'daniel,dan,danny,dank')
NameGroup.create!(names: 'danielle,dani,ellie')
NameGroup.create!(names: 'daphne,daph,daphie')
NameGroup.create!(names: 'david,davy,vida')
NameGroup.create!(names: 'deanne,ann,dee')
NameGroup.create!(names: 'deborah,deb,debi,debbie,debby')
NameGroup.create!(names: 'delbert,bert,del')
NameGroup.create!(names: 'deidre,deedee')
NameGroup.create!(names: 'delia,cordelia,fidelia,delius')
NameGroup.create!(names: 'delilah,dell,della,lil,lila')
NameGroup.create!(names: 'dell,adela,adelaide,delilah')
NameGroup.create!(names: 'della,adela,adelaide,delilah')
NameGroup.create!(names: 'delores,dee,dodie,dodie,lola')
NameGroup.create!(names: 'delpha,philadelphia')
NameGroup.create!(names: 'delphine,del,delf,delphi')
NameGroup.create!(names: 'demaris,dea,maris,mary')
NameGroup.create!(names: 'demerias,dea,maris,mary')
NameGroup.create!(names: 'democrates,mock')
NameGroup.create!(names: 'denise,dennis')
NameGroup.create!(names: 'deuteronomy,duty')
NameGroup.create!(names: 'diane,di,dicey,didi')
NameGroup.create!(names: 'diana,di,dicey,didi')
NameGroup.create!(names: 'dickson,dick')
NameGroup.create!(names: 'doctor,namegivento')
NameGroup.create!(names: 'dominic,dom,nick,nicky')
NameGroup.create!(names: 'dorinda,dora,dorothea')
NameGroup.create!(names: 'doris,dora')
NameGroup.create!(names: 'dorothea,doda,dora')
NameGroup.create!(names: 'dorothy,dee,dolly,dorothea,dot')
NameGroup.create!(names: 'dotha,dotty')
NameGroup.create!(names: 'douglas,doug')
NameGroup.create!(names: 'drusilla,silla')
NameGroup.create!(names: 'duncan,dunk')
NameGroup.create!(names: 'ebenezer,eb,eben,eber')
NameGroup.create!(names: 'edith,dicey,edie')
NameGroup.create!(names: 'edmund,ed,ned,ted')
NameGroup.create!(names: 'edna,edny')
NameGroup.create!(names: 'edward,ed,ned,ted')
NameGroup.create!(names: 'edwina,edwin')
NameGroup.create!(names: 'egbert,bert,burt')
NameGroup.create!(names: 'eighta,athy')
NameGroup.create!(names: 'eileen,helen')
NameGroup.create!(names: 'elaine,helen,lainie')
NameGroup.create!(names: 'elbert,albert')
NameGroup.create!(names: 'elbertson,elbert,bert')
NameGroup.create!(names: 'eleanor,elaine,ella,ellen,helen,lanna')
NameGroup.create!(names: 'leonora,nell,nellie,nora')
NameGroup.create!(names: 'elena,helen')
NameGroup.create!(names: 'elias,eli')
NameGroup.create!(names: 'elijah,eli,lige')
NameGroup.create!(names: 'eliphalel,life')
NameGroup.create!(names: 'elisa,lisa')
NameGroup.create!(names: 'elisha,eli,ellis,lish')
NameGroup.create!(names: 'eliza,elizabeth')
NameGroup.create!(names: 'elizabeth,bess,bessie,beth,bethia,betsy,bette,betty,dicey,elis,elsie,ibby,libby,liz,liza,lizabeth,lizzie,tess')
NameGroup.create!(names: 'ella,eleanor,gabriella,helen,luella')
NameGroup.create!(names: 'ellie,eleanor,gabriella,helen,luella')
NameGroup.create!(names: 'ellen,helen,nell,nellie')
NameGroup.create!(names: 'ellender,ellen,helen,nellie')
NameGroup.create!(names: 'elminie,minnie')
NameGroup.create!(names: 'elmira,mira')
NameGroup.create!(names: 'elnora,nora')
NameGroup.create!(names: 'eloise,heloise,louise')
NameGroup.create!(names: 'elsie,alice,elizabeth')
NameGroup.create!(names: 'elwood,ells,elly')
NameGroup.create!(names: 'elvira,elvie')
NameGroup.create!(names: 'elysia,lisa')
NameGroup.create!(names: 'emanuel,manny,manuel')
NameGroup.create!(names: 'emeline,emmer,emily,emmy,lina,millie')
NameGroup.create!(names: 'emil,emily')
NameGroup.create!(names: 'emily,emma,emmie,erma')
NameGroup.create!(names: 'ephraim,eph')
NameGroup.create!(names: 'erasmus,rasmus,raze')
NameGroup.create!(names: 'eric,rick,ricky,erica')
NameGroup.create!(names: 'ernest,ernie,ernestine')
NameGroup.create!(names: 'earnest,ernie,ernestine')
NameGroup.create!(names: 'ernestine,erna,tina,teeny,ernest')
NameGroup.create!(names: 'erwin,irwin')
NameGroup.create!(names: 'essy,es')
NameGroup.create!(names: 'eseneth,senie')
NameGroup.create!(names: 'estella,essy,stella')
NameGroup.create!(names: 'esther,essie,hester')
NameGroup.create!(names: 'eudicy,dicey')
NameGroup.create!(names: 'eudora,dora')
NameGroup.create!(names: 'eudoris,dosie,dossie')
NameGroup.create!(names: 'eugene,gene,eugenia,euy,gene,genie,jenny')
NameGroup.create!(names: 'eunice,nicie')
NameGroup.create!(names: 'euphemia,effie,effy')
NameGroup.create!(names: 'eurydice,dicey')
NameGroup.create!(names: 'eustacia,stacia,stacy')
NameGroup.create!(names: 'evangeline,evan,ev,vangie')
NameGroup.create!(names: 'evelyn,ev,eve,evelina')
NameGroup.create!(names: 'ezekiel,ez,zeke')
NameGroup.create!(names: 'ezideen,ez')
NameGroup.create!(names: 'experience,exie')
NameGroup.create!(names: 'faith,fay')
NameGroup.create!(names: 'fidelia,delia,delius')
NameGroup.create!(names: 'felicia,fel,feli,felix')
NameGroup.create!(names: 'felicity,flick,tick')
NameGroup.create!(names: 'ferdinand,ferdie,fred')
NameGroup.create!(names: 'ferdinando,ferdie,fred,nando')
NameGroup.create!(names: 'florence,flo,flora,florrie,floss,flossie')
NameGroup.create!(names: 'floyd,lloyd')
NameGroup.create!(names: 'frances,fan,fanny,fran,franie,france,frankie,franz,sis,francis')
NameGroup.create!(names: 'francis,frank,frances')
NameGroup.create!(names: 'franklin,frank')
NameGroup.create!(names: 'frederick,derick,fred,fredric,freddie,frish,fritz,frederica,rick')
NameGroup.create!(names: 'frederica,frederick')
NameGroup.create!(names: 'gabriel,gabe,gabby,garbrielle')
NameGroup.create!(names: 'gabrielle,ella,gabbie,gabriel')
NameGroup.create!(names: 'genevieve,gency,jinsey,jenny')
NameGroup.create!(names: 'geoffrey,geoff')
NameGroup.create!(names: 'george,jorge,georgiana')
NameGroup.create!(names: 'georgia,georgiana,george')
NameGroup.create!(names: 'gerald,jerry,geraldine,gerry')
NameGroup.create!(names: 'geraldine,dina,gerri,gerrie,jerry,deannie,gerald')
NameGroup.create!(names: 'gerhardt,gay')
NameGroup.create!(names: 'gertrude,gatty,gertie,trudy')
NameGroup.create!(names: 'gilbert,bert,bertie,gib,gil,wilber')
NameGroup.create!(names: 'gloria,glory')
NameGroup.create!(names: 'governor,govie')
NameGroup.create!(names: 'greenberry,berry,green')
NameGroup.create!(names: 'gretchen,margaret')
NameGroup.create!(names: 'gregory,greg')
NameGroup.create!(names: 'griselda,grissel')
NameGroup.create!(names: 'gustavus,gus')
NameGroup.create!(names: 'gwendolyn,genny,gwen,wendy')
NameGroup.create!(names: 'hamilton,ham')
NameGroup.create!(names: 'hannah,anna,hattie,nan,nanny,susannah')
NameGroup.create!(names: 'heather,hetty')
NameGroup.create!(names: 'herman,harman,dutch')
NameGroup.create!(names: 'harold,hal,harry')
NameGroup.create!(names: 'harriet,hatty,hattie,harry')
NameGroup.create!(names: 'harry,harold,henry')
NameGroup.create!(names: 'haseltine,hassie')
NameGroup.create!(names: 'helen,aileen,eileen,elaine,eleanor,ellen,lena,nell,nellie')
NameGroup.create!(names: 'helena,aileen,eileen,elaine,eleanor,ellen,lena,nell,nellie')
NameGroup.create!(names: 'heloise,eloise,lois')
NameGroup.create!(names: 'henrietta,etta,hank,hetty,nettie,retta,henry')
NameGroup.create!(names: 'henry,hal,hank,harry,hen,hence')
NameGroup.create!(names: 'herbert,bert,herb')
NameGroup.create!(names: 'hester,estherhessy,hetty')
NameGroup.create!(names: 'hezekiah,hez,ki,ky')
NameGroup.create!(names: 'honora,honey,nora,norah,norry')
NameGroup.create!(names: 'horace,harry,horatio')
NameGroup.create!(names: 'hortense,harty,tensey')
NameGroup.create!(names: 'hosea,hosey,hosie')
NameGroup.create!(names: 'howard,hal,howie')
NameGroup.create!(names: 'hubert,hugh,hugo,bert')
NameGroup.create!(names: 'ian,john')
NameGroup.create!(names: 'ignatius,iggy,nace')
NameGroup.create!(names: 'ignatzio,iggy,nace,naz')
NameGroup.create!(names: 'immanuel,emmanuel,manuel')
NameGroup.create!(names: 'india,indie,indy')
NameGroup.create!(names: 'inez,agnes')
NameGroup.create!(names: 'iona,onnie')
NameGroup.create!(names: 'irene,rena,rennie')
NameGroup.create!(names: 'irvin,irving')
NameGroup.create!(names: 'irwin,erwin')
NameGroup.create!(names: 'isaac,ike,zeke')
NameGroup.create!(names: 'isabelle,bella,belle,cybilla,elizabeth,ib,issy,nib,sabe,sabra,sibella,tibbie')
NameGroup.create!(names: 'isabella,bella,belle,cybilla,elizabeth,ib,issy,nib,sabe,sabra,sibella,tibbie')
NameGroup.create!(names: 'isadora,dora,issy,isidore')
NameGroup.create!(names: 'isaiah,zadie,zay')
NameGroup.create!(names: 'isidore,izzy,isadora')
NameGroup.create!(names: 'iva,ivy')
NameGroup.create!(names: 'ivan,john')
NameGroup.create!(names: 'jacob,jake')
NameGroup.create!(names: 'jacqueline,jackie,jack')
NameGroup.create!(names: 'jackson,jack')
NameGroup.create!(names: 'jahoda,hoda,hodie,hody')
NameGroup.create!(names: 'james,jamie,jim,jeb')
NameGroup.create!(names: 'jane,janet,janie,jessie,jenny,jinsey,joan,joanna')
NameGroup.create!(names: 'jannett,nettie')
NameGroup.create!(names: 'jasper,casper,jap')
NameGroup.create!(names: 'jayme,jay')
NameGroup.create!(names: 'jean,jennie,joanna')
NameGroup.create!(names: 'jeanette,jeanne,nettie')
NameGroup.create!(names: 'jedediah,diah,dyer,jed')
NameGroup.create!(names: 'jeffrey,jeff')
NameGroup.create!(names: 'jefferey,jeff')
NameGroup.create!(names: 'jehu,gee,hugh')
NameGroup.create!(names: 'jemima,jemma,mima,mimi')
NameGroup.create!(names: 'jennet,jenny,jessie')
NameGroup.create!(names: 'jennifer,jan,jenny')
NameGroup.create!(names: 'jeremiah,jeremy,jerry')
NameGroup.create!(names: 'jerita,rita')
NameGroup.create!(names: 'jessica,jess,jesse,jessie,sica')
NameGroup.create!(names: 'jincy,jane')
NameGroup.create!(names: 'jinsy,jane')
NameGroup.create!(names: 'jessie,jane,janet,jess')
NameGroup.create!(names: 'joanna,jane,jean,joan,jody,johanna,john')
NameGroup.create!(names: 'john,hans,ian,ivan,jack,jean,jehu,jayhugh,jock')
NameGroup.create!(names: 'johannes,johnjohnny,jonathan')
NameGroup.create!(names: 'jonathan,john,jon,nat,nathan')
NameGroup.create!(names: 'joseph,joe,joey')
NameGroup.create!(names: 'josephine,jo,joey,josey,joseie')
NameGroup.create!(names: 'josetta,jettie')
NameGroup.create!(names: 'joshua,josh')
NameGroup.create!(names: 'joyce,joy')
NameGroup.create!(names: 'juanita,nita')
NameGroup.create!(names: 'judah,jude,juder')
NameGroup.create!(names: 'judith,juda,jude,judi,judie,judy')
NameGroup.create!(names: 'julia,jill,julie,juliet,julian,julius,jule')
NameGroup.create!(names: 'june,junius')
NameGroup.create!(names: 'justin,justus,justina')
NameGroup.create!(names: 'karonhappuck,carrie,karen,karon,happy')
NameGroup.create!(names: 'katarina,catherine,tina')
NameGroup.create!(names: 'kathleen,cathy,karen,katharine,katie,kathleen,kay,kit,kittie')
NameGroup.create!(names: 'kayla,kay,kay')
NameGroup.create!(names: 'kendra,kay,kenny,kenj,kenji')
NameGroup.create!(names: 'keziah,kezzie,kezzy,kid,kizzy')
NameGroup.create!(names: 'kristel,kris')
NameGroup.create!(names: 'kristine,kissy,kris,krissy')
NameGroup.create!(names: 'kristopher,chris,kris')
NameGroup.create!(names: 'lafayette,fate,fayette,left,leffie,leffy')
NameGroup.create!(names: 'laodicia,dicy,cenia')
NameGroup.create!(names: 'lauren,laurie,ren')
NameGroup.create!(names: 'laurinda,laura,lawrence')
NameGroup.create!(names: 'lauryn,laurie')
NameGroup.create!(names: 'laveda,veda')
NameGroup.create!(names: 'laverne,verna,vernon')
NameGroup.create!(names: 'lavinia,vina,viney,vonnie,wyncha')
NameGroup.create!(names: 'lavonia,vina,viney,vonnie,wyncha')
NameGroup.create!(names: 'louvinia,vina,viney,vonnie,wyncha')
NameGroup.create!(names: 'lawrence,larry,lars,laurence,lawrie,lon,lorry,laura')
NameGroup.create!(names: 'leanne,annie,lea')
NameGroup.create!(names: 'lecurgus,curg')
NameGroup.create!(names: 'lemuel,lem')
NameGroup.create!(names: 'lena,leenlina')
NameGroup.create!(names: 'leonard,leo,leon,leona')
NameGroup.create!(names: 'leonidas,lee,leon')
NameGroup.create!(names: 'leonore,elenor,honor,nora')
NameGroup.create!(names: 'leonora,elenor,honor,nora')
NameGroup.create!(names: 'leroy,lee,roy')
NameGroup.create!(names: 'leslie,les,lester')
NameGroup.create!(names: 'letitia,lettie,lettice,titia,tish')
NameGroup.create!(names: 'levicy,vicy')
NameGroup.create!(names: 'levone,von')
NameGroup.create!(names: 'lavonne,von')
NameGroup.create!(names: 'lillian,lil,lila,lilly,lolly,odie')
NameGroup.create!(names: 'lincoln,link')
NameGroup.create!(names: 'lionel,leon')
NameGroup.create!(names: 'littleberry,berry,l.b.,little')
NameGroup.create!(names: 'lois,heloise,louise')
NameGroup.create!(names: 'loretta,etta,laura,lorrie,retta')
NameGroup.create!(names: 'lorraine,lorrie')
NameGroup.create!(names: 'louis,lewis,lou,louie,louise')
NameGroup.create!(names: 'louise,eliza,eloise,issie,lois,lou,lulu,louis')
NameGroup.create!(names: 'lucia,lucy,lucius')
NameGroup.create!(names: 'lucias,lucas,luke')
NameGroup.create!(names: 'lucille,ceall,cille,lucy')
NameGroup.create!(names: 'lucina,sinah')
NameGroup.create!(names: 'lucinda,cindy,lucy')
NameGroup.create!(names: 'lucretia,creasey')
NameGroup.create!(names: 'luella,ella')
NameGroup.create!(names: 'lunetta,nettie')
NameGroup.create!(names: 'lurana,lura')
NameGroup.create!(names: 'mabel,amabel,mehitabel')
NameGroup.create!(names: 'mac,mc')
NameGroup.create!(names: 'mack,mac,mc')
NameGroup.create!(names: 'mackenzie,kenzy,mac,mack')
NameGroup.create!(names: 'madeline,lena,maddie,madge,maggie,maud,middy')
NameGroup.create!(names: 'maud,middy')
NameGroup.create!(names: 'madison,maddy,mattie')
NameGroup.create!(names: 'magdalena,lena,maggie')
NameGroup.create!(names: 'mahala,haley,huldah')
NameGroup.create!(names: 'malachi,mally')
NameGroup.create!(names: 'malcolm,mac,mal,malc')
NameGroup.create!(names: 'malinda,lindy')
NameGroup.create!(names: 'manerva,eve,minerva,nerva,nervie')
NameGroup.create!(names: 'manoah,noah')
NameGroup.create!(names: 'manola,nonnie')
NameGroup.create!(names: 'manuel,emanuel,manny')
NameGroup.create!(names: 'marcus,mark,marcia')
NameGroup.create!(names: 'margaret,daisy,greta,madge,maggie,maisie,marge,margo,meg,megan,metta,midge,peggie')
NameGroup.create!(names: 'margarita,rita,daisy,greta,madge,maggie,maisie,marge,margo,meg,megan,metta,midge,peggie')
NameGroup.create!(names: 'mariah,maria,mary')
NameGroup.create!(names: 'marie,mae')
NameGroup.create!(names: 'marion,mary')
NameGroup.create!(names: 'marian,marianna,marion')
NameGroup.create!(names: 'marilyn,mary')
NameGroup.create!(names: 'marissa,rissa')
NameGroup.create!(names: 'marjorie,madge,marge,margie')
NameGroup.create!(names: 'marsha,marcie,mary')
NameGroup.create!(names: 'martha,marnie,mart,marty,mat,mattie,patsy,patty')
NameGroup.create!(names: 'martine,tine')
NameGroup.create!(names: 'marvin,marv,merv,mervyn')
NameGroup.create!(names: 'mary,mae,mamie,maria,mariah,marie')
NameGroup.create!(names: 'marietta,marion,maureen,mary,mae,mamie,maria,mariah,marie,may,mercy,minnie,mitzi,mollie,molly,polly')
NameGroup.create!(names: 'matthew,matt,matthias')
NameGroup.create!(names: 'mathilda,patty,tillie')
NameGroup.create!(names: 'matilda,mat,matty,maud,tilda,tillie')
NameGroup.create!(names: 'marguerite,peggy')
NameGroup.create!(names: 'maureen,mary')
NameGroup.create!(names: 'maurice,maury,morris,mossie')
NameGroup.create!(names: 'mavine,mave')
NameGroup.create!(names: 'mavery,mave')
NameGroup.create!(names: 'maxine,max')
NameGroup.create!(names: 'may,mae')
NameGroup.create!(names: 'mckenna,ken,kenna,meaka')
NameGroup.create!(names: 'medora,dora')
NameGroup.create!(names: 'megan,meg')
NameGroup.create!(names: 'mehitabel,hetty,mabel,mitty')
NameGroup.create!(names: 'melanie,mellie')
NameGroup.create!(names: 'melchizedek,dick,zadock')
NameGroup.create!(names: 'melinda,linda,lindy,mel')
NameGroup.create!(names: 'melissa,alyssa,lisa,mel,milly,missy,melissa,missa')
NameGroup.create!(names: 'mellony,mellia')
NameGroup.create!(names: 'melody,lodi')
NameGroup.create!(names: 'melvin,mel')
NameGroup.create!(names: 'melvina,vina')
NameGroup.create!(names: 'mercedes,merci,mercy,sadie')
NameGroup.create!(names: 'micajah,cage')
NameGroup.create!(names: 'michael,mickey,mike,mitchell')
NameGroup.create!(names: 'michelle,mickey,shelly')
NameGroup.create!(names: 'mildred,mell,milly,mimi')
NameGroup.create!(names: 'millicent,milly')
NameGroup.create!(names: 'minerva,mina,minnie,nerva,nervie')
NameGroup.create!(names: 'miranda,mandy,mari,mira,randy')
NameGroup.create!(names: 'miriam,mary,mitzi')
NameGroup.create!(names: 'mitchell,michael,mitch')
NameGroup.create!(names: 'mitzi,mary')
NameGroup.create!(names: 'monet,nettie')
NameGroup.create!(names: 'monica,monna,monnie')
NameGroup.create!(names: 'monteleon,monte')
NameGroup.create!(names: 'montesque,monty')
NameGroup.create!(names: 'montgomery,gum,monty')
NameGroup.create!(names: 'mortimer,mort')
NameGroup.create!(names: 'moses,amos,mose,moss')
NameGroup.create!(names: 'muriel,mur')
NameGroup.create!(names: 'myrtle,mert,myrt,myrti')
NameGroup.create!(names: 'nadine,deedee,nada')
NameGroup.create!(names: 'nancy,alsoamalename')
NameGroup.create!(names: 'nancy,agnes,ann,nan,nance,nannie')
NameGroup.create!(names: 'naomi,omi')
NameGroup.create!(names: 'napoleon,leon,nap,poley,pony')
NameGroup.create!(names: 'natalie,nattie,nettie')
NameGroup.create!(names: 'natasha,nat,tasha')
NameGroup.create!(names: 'nathaniel,jonathan,nat,nate,natty,nathan,tan')
NameGroup.create!(names: 'nelson,nels')
NameGroup.create!(names: 'nicholas,nick,nicky')
NameGroup.create!(names: 'nicodemus,nick')
NameGroup.create!(names: 'nicole,cole,nikki,nole')
NameGroup.create!(names: 'nora,nonie')
NameGroup.create!(names: 'nowell,noel')
NameGroup.create!(names: 'obadiah,diah,dyer,obe,obed,obie')
NameGroup.create!(names: 'obedience,beda,beedy,biddie,obed')
NameGroup.create!(names: 'octavia,tave,tavia')
NameGroup.create!(names: 'odell,odo')
NameGroup.create!(names: 'olive,ollie')
NameGroup.create!(names: 'olivia,livia,olive,oliver')
NameGroup.create!(names: 'oliver,ollie')
NameGroup.create!(names: 'onicyphorous,cy,cyphorus,one,osaforum,osaforus,syphorous')
NameGroup.create!(names: 'orilla,ora,rilly')
NameGroup.create!(names: 'orlando,roland')
NameGroup.create!(names: 'orphelia,phelia')
NameGroup.create!(names: 'oswald,ossy,waldo')
NameGroup.create!(names: 'otis,ode,ote')
NameGroup.create!(names: 'pamela,pam')
NameGroup.create!(names: 'pandora,dora')
NameGroup.create!(names: 'parthenia,parsuny,pasoonie,phenie,teeny')
NameGroup.create!(names: 'patience,pat,patty')
NameGroup.create!(names: 'patricia,pat,patsy,patty,tricia,trish,trixie,patrick')
NameGroup.create!(names: 'patrick,paddy,pat,patsy,peter,patricia,pete')
NameGroup.create!(names: 'paul,paula,pauline,polly')
NameGroup.create!(names: 'pauline,polly')
NameGroup.create!(names: 'penelope,neppie,penny')
NameGroup.create!(names: 'percival,perce,percy')
NameGroup.create!(names: 'peregrine,perry')
NameGroup.create!(names: 'permelia,mellie,melly,milly')
NameGroup.create!(names: 'pernetta,nettie')
NameGroup.create!(names: 'persephone,seph,sephy')
NameGroup.create!(names: 'petronella,nellie')
NameGroup.create!(names: 'pheriba,ferbie,pherbia')
NameGroup.create!(names: 'pheney,josephine')
NameGroup.create!(names: 'philip,filip,phil,pip,phyllis,philippa')
NameGroup.create!(names: 'philadelphia,delphia')
NameGroup.create!(names: 'philander,fie')
NameGroup.create!(names: 'philipina,phoebe,penie')
NameGroup.create!(names: 'philomena,menaalmena')
NameGroup.create!(names: 'phoebe,fifi')
NameGroup.create!(names: 'pinckney,pink')
NameGroup.create!(names: 'pleasant,ples')
NameGroup.create!(names: 'pocahontas,pokey')
NameGroup.create!(names: 'posthuma,humey')
NameGroup.create!(names: 'prescott,pres,scott')
NameGroup.create!(names: 'priscilla,cil,cilla,ciller,prissy,siller')
NameGroup.create!(names: 'providence,provy')
NameGroup.create!(names: 'prudence,densy,prudy')
NameGroup.create!(names: 'rachel,rae,ray,raech')
NameGroup.create!(names: 'randolph,dolph,rafe,randall,randy')
NameGroup.create!(names: 'raphael,raff')
NameGroup.create!(names: 'ramona,mona')
NameGroup.create!(names: 'raymond,ray')
NameGroup.create!(names: 'rebecca,becca,beck,beckie,becky,reba')
NameGroup.create!(names: 'regina,gina,ray')
NameGroup.create!(names: 'reginald,reg,reggie,rex,reynold')
NameGroup.create!(names: 'reuben,rube,ruby')
NameGroup.create!(names: 'reynold,reginald')
NameGroup.create!(names: 'rhoda,rodie')
NameGroup.create!(names: 'rhodella,della')
NameGroup.create!(names: 'rhyna,rhynie')
NameGroup.create!(names: 'richard,dick,richie,rick,ritchie')
NameGroup.create!(names: 'robert,dob,dobbin,bob,bobby,rob,robin,rupert,roberta')
NameGroup.create!(names: 'roberta,bert,bobbie,robbie,robert')
NameGroup.create!(names: 'roderick,erick,rod,rickie')
NameGroup.create!(names: 'roger,hodge,hodgekin')
NameGroup.create!(names: 'roland,orlando,rowland')
NameGroup.create!(names: 'ronald,ron,ronnie')
NameGroup.create!(names: 'roscoe,ross')
NameGroup.create!(names: 'rosina,sina')
NameGroup.create!(names: 'roxane,rox,roxie')
NameGroup.create!(names: 'rudolph,dolph,rolf,rollo,rudy')
NameGroup.create!(names: 'russell,russ')
NameGroup.create!(names: 'ryan,ry')
NameGroup.create!(names: 'sabrina,bri,brina,sabby,sabra')
NameGroup.create!(names: 'salome,loomie')
NameGroup.create!(names: 'salvador,sal')
NameGroup.create!(names: 'samantha,mantha,sammy,sam')
NameGroup.create!(names: 'samson,sam')
NameGroup.create!(names: 'sampson,sam')
NameGroup.create!(names: 'samuel,sam,sonny')
NameGroup.create!(names: 'samyra,myra')
NameGroup.create!(names: 'sandra,alexandra,sandy')
NameGroup.create!(names: 'sanford,sandy')
NameGroup.create!(names: 'sarah,cera,sadie,sal,sallie,sara,sukie,surry')
NameGroup.create!(names: 'sarilla,silla')
NameGroup.create!(names: 'serena,rena')
NameGroup.create!(names: 'savannah,anna,vannie')
NameGroup.create!(names: 'scott,sceeter,squat,scottie,scotty')
NameGroup.create!(names: 'sebastian,sebby')
NameGroup.create!(names: 'selma,anselm')
NameGroup.create!(names: 'serena,rena')
NameGroup.create!(names: 'serilla,rilla')
NameGroup.create!(names: 'shaina,sha,shay,sha,sha')
NameGroup.create!(names: 'sharon,sha,shay')
NameGroup.create!(names: 'sheila,cecilia')
NameGroup.create!(names: 'sheldon,shelly')
NameGroup.create!(names: 'sheridan,dan,danny')
NameGroup.create!(names: 'sidney,sid')
NameGroup.create!(names: 'sibbilla,sibbell,sybill,sibbie')
NameGroup.create!(names: 'sigfrid,sid')
NameGroup.create!(names: 'sigfired,sid')
NameGroup.create!(names: 'sigismund,sig')
NameGroup.create!(names: 'silas,si')
NameGroup.create!(names: 'silence,liley')
NameGroup.create!(names: 'silvester,si,syl,sly,vest,vester')
NameGroup.create!(names: 'simeon,sim,simon')
NameGroup.create!(names: 'socrates,crate')
NameGroup.create!(names: 'solomon,sal,salmon,sol,solly,zolly')
NameGroup.create!(names: 'sondra,dre,sonnie')
NameGroup.create!(names: 'sophronia,frona,fronia,sophia')
NameGroup.create!(names: 'stephanie,annie,steph,stephie,stephen')
NameGroup.create!(names: 'stephen,step,steve,stevie,steven')
NameGroup.create!(names: 'submit,mitty')
NameGroup.create!(names: 'sullivan,sully')
NameGroup.create!(names: 'susannah,hannah,sudy,sue,sukey,susan,susie,suzanne')
NameGroup.create!(names: 'suzanne,susie,suki,sue')
NameGroup.create!(names: 'sybill,sibbie')
NameGroup.create!(names: 'sydney,sid')
NameGroup.create!(names: 'sylvanus,sly,syl')
NameGroup.create!(names: 'sylvester,si,syl,sly,vest,vester')
NameGroup.create!(names: 'tabitha,tabby')
NameGroup.create!(names: 'tamarra,tammy')
NameGroup.create!(names: 'tanafra,tanny')
NameGroup.create!(names: 'tasha,tash,tashie')
NameGroup.create!(names: 'temperance,tempy')
NameGroup.create!(names: 'terence,terry')
NameGroup.create!(names: 'teresa,terry,tess,tessie,tyrza')
NameGroup.create!(names: 'thaddeus,tad,thad')
NameGroup.create!(names: 'theodora,dora')
NameGroup.create!(names: 'theodore,dorey,ted,theotric,theodora')
NameGroup.create!(names: 'theodosia,dosia,theo,theodosius')
NameGroup.create!(names: 'theophilus,ophi')
NameGroup.create!(names: 'theotha,otha')
NameGroup.create!(names: 'theresa,terry,tess,tessie,thursa,ticy,tracy,trissy')
NameGroup.create!(names: 'thomas,thom,tom')
NameGroup.create!(names: 'thomasa,tamzine')
NameGroup.create!(names: 'tiffany,tiff,tiffy')
NameGroup.create!(names: 'tilford,tillie')
NameGroup.create!(names: 'timothy,tim')
NameGroup.create!(names: 'tobias,tobe,toby,bias')
NameGroup.create!(names: 'tranquilla,trannie,quilla')
NameGroup.create!(names: 'unice,eunice,nicie')
NameGroup.create!(names: 'uriah,ury')
NameGroup.create!(names: 'ursula,sula,sulie')
NameGroup.create!(names: 'valentina,felty,val,vallie')
NameGroup.create!(names: 'valentine,felty,val,vallie')
NameGroup.create!(names: 'valerie,val')
NameGroup.create!(names: 'vanburen,buren')
NameGroup.create!(names: 'vandalia,vannie')
NameGroup.create!(names: 'vanessa,nessa,van,vannie')
NameGroup.create!(names: 'vernisee,nicey')
NameGroup.create!(names: 'veronica,franky,ronnie,ronna,vonnie')
NameGroup.create!(names: 'victor,vic,vick')
NameGroup.create!(names: 'victoria,toria,torrie,tory,vicki,victor')
NameGroup.create!(names: 'vincent,vin,vince,vinnie,vinny')
NameGroup.create!(names: 'viola,ola,vi')
NameGroup.create!(names: 'violetta,lettie')
NameGroup.create!(names: 'virginia,ginger,ginny,jane,jennie,jenny,jinie,virgie')
NameGroup.create!(names: 'vivian,vi,viv')
NameGroup.create!(names: 'waldo,oswald')
NameGroup.create!(names: 'wallace,wallie,wally')
NameGroup.create!(names: 'walter,wat')
NameGroup.create!(names: 'webster,webb')
NameGroup.create!(names: 'wendy,wen')
NameGroup.create!(names: 'wilber,wib')
NameGroup.create!(names: 'wilfred,fred,willie')
NameGroup.create!(names: 'wilhelmina,billie,helmie,mina,minnie,willie,wilma,wilhelm,william')
NameGroup.create!(names: 'william,bill,bud,will,willie')
NameGroup.create!(names: 'willis,bill,willy')
NameGroup.create!(names: 'wilda,willie')
NameGroup.create!(names: 'wilma,billiewilhelm,william')
NameGroup.create!(names: 'winfield,field,win,winny')
NameGroup.create!(names: 'winifred,freddie,winnie,winnet')
NameGroup.create!(names: 'winton,wint')
NameGroup.create!(names: 'woodrow,woody')
NameGroup.create!(names: 'yeona,ona,onie')
NameGroup.create!(names: 'yulan,lan,yul')
NameGroup.create!(names: 'yvonne,vonna')
NameGroup.create!(names: 'zachariah,zach,zacharias,zachary,zeke')
NameGroup.create!(names: 'zedediah,zed' }
