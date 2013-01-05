require 'rubygems'
require 'rack'
require 'rack/contrib'
require 'rack-rewrite'
require 'mime/types'

use Rack::ETag
module ::Rack
    class TryStatic < Static

        def initialize(app, options)
            super
            @try = ([''] + Array(options.delete(:try)) + [''])
        end

        def call(env)
            @next = 0
            while @next < @try.size && 404 == (resp = super(try_next(env)))[0] 
                @next += 1
            end
            404 == resp[0] ? @app.call : resp
        end

        private
        def try_next(env)
        	key = 'PATH_INFO'
            path_info = env[key]
        	if path_info.downcase =~ /webmatrixrazorwebpagesandfriendlyurls.aspx/ || path_info.downcase =~ /permalink,guid,f598f302-2534-483f-8eaf-7219bfb9cbca.aspx/
        		return env.merge(key => '/2010/07/08/webmatrix--razor--webpages-and-friendly-urls-.html')
        	end        	
        	if path_info.downcase =~ /apersonalretrospectiveonwindycitydb.aspx/ || path_info.downcase =~ /permalink,guid,7587f94d-abe2-45c2-bf9e-427989970c39.aspx/
        		return env.merge(key => '/2010/07/05/a-personal-retrospective-on-windycitydb.html')
        	end        	
        	if path_info.downcase =~ /picklecucumberstepsnotrecognizedbeforecreatingthemodel.aspx/ || path_info.downcase =~ /permalink,guid,23cdeac6-c365-4cf6-8e5b-075979749255.aspx/
        		return env.merge(key => '/2010/06/17/pickle-cucumber-steps-not-recognized-before-creating-the-model-.html')
        	end        	
        	if path_info.downcase =~ /nodejswebdevelopmentwithexpress.aspx/ || path_info.downcase =~ /permalink,guid,6f477737-d35f-428f-a796-b4b2193c85c4.aspx/
        		return env.merge(key => '/2010/06/14/node-js-web-development-with-express.html')
        	end        	
        	if path_info.downcase =~ /startingwithnodejs.aspx/ || path_info.downcase =~ /permalink,guid,8ae28990-2e51-438c-af5b-e82370d061cd.aspx/
        		return env.merge(key => '/2010/06/11/starting-with-node-js-.html')
        	end        	
        	if path_info.downcase =~ /livingonthedarksideubuntuandrordevelopmentfromawindowsdevperspective.aspx/ || path_info.downcase =~ /permalink,guid,df71dab6-b0fb-418f-adfd-74e30f8d4d5a.aspx/
        		return env.merge(key => '/2010/06/11/living-on-the-dark-side--ubuntu-and-ror-development-from-a-windows-dev-perspective-.html')
        	end        	
        	if path_info.downcase =~ /aretherealotofprogramsforthat.aspx/ || path_info.downcase =~ /permalink,guid,83f5c35a-aa4b-491f-8c88-440bee30d0b0.aspx/
        		return env.merge(key => '/2010/05/13/are-there-a-lot-of-programs-for-that-.html')
        	end        	
        	if path_info.downcase =~ /mybddsessionattorontocodecampslidescodeandretrospective.aspx/ || path_info.downcase =~ /permalink,guid,7004a045-b8bb-4048-9c0e-5efe23f70839.aspx/
        		return env.merge(key => '/2010/05/02/my-bdd-session-at-toronto-code-camp---slides--code-and-retrospective-.html')
        	end        	
        	if path_info.downcase =~ /mongodbproviderforblogenginenetpart3mappersandmorerefactoring.aspx/ || path_info.downcase =~ /permalink,guid,9aa6d879-73db-46d3-8ee9-f3021a426f5f.aspx/
        		return env.merge(key => '/2010/04/20/mongodb-provider-for-blogengine-net--part-3-–-mappers-and-more-refactoring-.html')
        	end        	
        	if path_info.downcase =~ /speakingattorontocodecamp2010onbdduserstoriesforendtoendtesting.aspx/ || path_info.downcase =~ /permalink,guid,40e34321-4747-4193-aa1d-cef7b7731a20.aspx/
        		return env.merge(key => '/2010/04/15/speaking-at-toronto-code-camp-2010-on-bdd-+-user-stories-for-end-to-end-testing-.html')
        	end        	
        	if path_info.downcase =~ /designingtheobviousbookreview.aspx/ || path_info.downcase =~ /permalink,guid,5bd6b9e3-de49-4bfa-baa7-38158d5f908a.aspx/
        		return env.merge(key => '/2010/04/09/designing-the-obvious--book-review-.html')
        	end        	
        	if path_info.downcase =~ /bookreviewuserstoriesappliedforagilesoftwaredevelopmentbymikecohn.aspx/ || path_info.downcase =~ /permalink,guid,0f23082e-a680-4f6f-a02d-cb0f569c1d85.aspx/
        		return env.merge(key => '/2010/03/18/book-review--user-stories-applied--for-agile-software-development-by-mike-cohn.html')
        	end        	
        	if path_info.downcase =~ /gherkineditorsyntaxhighlightingandautocompletetowriteyourstories.aspx/ || path_info.downcase =~ /permalink,guid,cfc87837-7a67-4c13-9101-cb777f859536.aspx/
        		return env.merge(key => '/2010/03/16/gherkin-editor--syntax-highlighting-and-auto-complete-to-write-your-stories-.html')
        	end        	
        	if path_info.downcase =~ /devteachtoronto2010personalretrospective.aspx/ || path_info.downcase =~ /permalink,guid,3eb4fe45-b28b-42ef-b385-7bb2b43a20f4.aspx/
        		return env.merge(key => '/2010/03/13/devteach-toronto-2010-personal-retrospective-.html')
        	end        	
        	if path_info.downcase =~ /mongodbproviderforblogenginenetsavingapostpart2.aspx/ || path_info.downcase =~ /permalink,guid,b3238ce0-14f5-4bdb-a671-118b9804e389.aspx/
        		return env.merge(key => '/2010/03/10/mongodb-provider-for-blogengine-net--saving-a-post-–-part-2.html')
        	end        	
        	if path_info.downcase =~ /creatingamongodbproviderforblogenginenetpart1.aspx/ || path_info.downcase =~ /permalink,guid,01dde697-ee9d-4fd9-905e-93c2ab782ac2.aspx/
        		return env.merge(key => '/2010/03/08/creating-a-mongodb-provider-for-blogengine-net-–-part-1.html')
        	end        	
        	if path_info.downcase =~ /cloneaprojectoncodeplextoyourowncodeplexrepowithmercurial.aspx/ || path_info.downcase =~ /permalink,guid,c7c2b4c2-a8ca-4aa9-8a0c-2e06d059995d.aspx/
        		return env.merge(key => '/2010/03/02/clone-a-project-on-codeplex-to-your-own-codeplex-repo-with-mercurial-.html')
        	end        	
        	if path_info.downcase =~ /videosofthepycon2010sessions.aspx/ || path_info.downcase =~ /permalink,guid,68bda724-29a4-427a-98ff-803e4d56a713.aspx/
        		return env.merge(key => '/2010/02/25/videos-of-the-pycon-2010-sessions-.html')
        	end        	
        	if path_info.downcase =~ /goingmobilewithmippin.aspx/ || path_info.downcase =~ /permalink,guid,0ab2eb65-fd64-411a-842f-2f2a957fa87d.aspx/
        		return env.merge(key => '/2010/02/25/going-mobile-with-mippin-.html')
        	end        	
        	if path_info.downcase =~ /diggingspecflowmisspellinggerkhinfiles.aspx/ || path_info.downcase =~ /permalink,guid,d31ddbdd-0d5a-49b3-9546-f74cdf554f03.aspx/
        		return env.merge(key => '/2010/02/23/digging-specflow--misspelling-gerkhin-files.html')
        	end        	
        	if path_info.downcase =~ /mercurialintegrationwithvisualstudio.aspx/ || path_info.downcase =~ /permalink,guid,201e653d-0fd0-464d-9d2e-42707f7b1e33.aspx/
        		return env.merge(key => '/2010/02/19/mercurial-integration-with-visual-studio.html')
        	end        	
        	if path_info.downcase =~ /bookreviewagileretrospectivesmakinggoodteamsgreat.aspx/ || path_info.downcase =~ /permalink,guid,ba89969b-2442-4fe5-91e9-01b61d1ca504.aspx/
        		return env.merge(key => '/2010/02/18/book-review--agile-retrospectives-–-making-good-teams-great-.html')
        	end        	
        	if path_info.downcase =~ /continuousimprovementmylistofbooksforthenextlittlewhile.aspx/ || path_info.downcase =~ /permalink,guid,5196a90a-3fce-4775-9f50-a66dd80cd2a8.aspx/
        		return env.merge(key => '/2010/02/17/continuous-improvement--my-list-of-books-for-the-next-little-while-.html')
        	end        	
        	if path_info.downcase =~ /gitintegrationwithvisualstudio.aspx/ || path_info.downcase =~ /permalink,guid,bb4ab5d2-3c4a-4483-a264-9fe36a8ecb95.aspx/
        		return env.merge(key => '/2010/02/15/git-integration-with-visual-studio.html')
        	end        	
        	if path_info.downcase =~ /usingspecflowwatinorbddforwebapplicationswithoutleavingtheclr.aspx/ || path_info.downcase =~ /permalink,guid,d0a61fd3-2800-4390-b3e2-82121ab202bd.aspx/
        		return env.merge(key => '/2010/02/02/using-specflow-+-watin-or-bdd-for-web-applications-without-leaving-the-clr-.html')
        	end        	
        	if path_info.downcase =~ /testdrivenoutsideinstartingwithcucumberandrubymine.aspx/ || path_info.downcase =~ /permalink,guid,a6ac40ea-5116-44f3-af01-f745df463fa3.aspx/
        		return env.merge(key => '/2010/01/27/test-driven-outside-in--starting-with-cucumber-and-rubymine-.html')
        	end        	
        	if path_info.downcase =~ /rubykoanslearningrubythetestdrivenway.aspx/ || path_info.downcase =~ /permalink,guid,faa0bfeb-b7f4-4943-b11a-9d40ad59d35a.aspx/
        		return env.merge(key => '/2010/01/21/ruby-koans--learning-ruby-the-test-driven-way-.html')
        	end        	
        	if path_info.downcase =~ /thesimplicityandspeedofgitanddvcsingeneral.aspx/ || path_info.downcase =~ /permalink,guid,c226ddf4-3e0a-4f7c-ac30-ee403bbea430.aspx/
        		return env.merge(key => '/2010/01/19/the-simplicity-and-speed-of-git-and-dvcs-in-general-.html')
        	end        	
        	if path_info.downcase =~ /notesandpersonalretrospectivefrommyfirstcodemash.aspx/ || path_info.downcase =~ /permalink,guid,ed4c2dd7-f334-4d99-ad7e-4226bc4bdae3.aspx/
        		return env.merge(key => '/2010/01/18/notes-and-personal-retrospective-from-my-first-codemash-.html')
        	end        	
        	if path_info.downcase =~ /insertrouterouteregistrationafterthefactonaspnetmvc.aspx/ || path_info.downcase =~ /permalink,guid,e22d8680-ed5e-4038-a9c9-ad705ea8aeac.aspx/
        		return env.merge(key => '/2010/01/01/insert-route--route-registration-after-the-fact-on-asp-net-mvc.html')
        	end        	
        	if path_info.downcase =~ /codemashscheduleronlinepickandchoosesessionstogoandexporttoyourcalendar.aspx/ || path_info.downcase =~ /permalink,guid,0b41d1d6-797f-45aa-8b05-96f27998fd5f.aspx/
        		return env.merge(key => '/2009/12/26/codemash-scheduler-online-–-pick-and-choose-sessions-to-go-and-export-to-your-calendar-.html')
        	end        	
        	if path_info.downcase =~ /aspnetmvcinactionbookreview.aspx/ || path_info.downcase =~ /permalink,guid,d7981845-4d85-4775-8101-882d98a54040.aspx/
        		return env.merge(key => '/2009/11/22/asp-net-mvc-in-action--book-review.html')
        	end        	
        	if path_info.downcase =~ /mynewanimprovedtoolingforbuildsandprojectmanagement.aspx/ || path_info.downcase =~ /permalink,guid,f63b4424-be13-4d32-bc0b-6bc2e533da6b.aspx/
        		return env.merge(key => '/2009/11/15/my-new-an-improved-tooling-for-builds-and-project-management-.html')
        	end        	
        	if path_info.downcase =~ /usingmongodbfromc.aspx/ || path_info.downcase =~ /permalink,guid,c2bb6ace-7f84-48c7-957a-e7998a2f789b.aspx/
        		return env.merge(key => '/2009/11/09/using-mongodb-from-c-sharp.html')
        	end        	
        	if path_info.downcase =~ /excellentpostonarealsiteusingmongodb.aspx/ || path_info.downcase =~ /permalink,guid,96142ec6-3559-4ff2-869a-e11ab12b2ea1.aspx/
        		return env.merge(key => '/2009/11/08/excellent-post-on-a-real-site-using-mongodb.html')
        	end        	
        	if path_info.downcase =~ /pragmaticthinkinglearningbookreview.aspx/ || path_info.downcase =~ /permalink,guid,89713157-2807-4c97-8559-cbf26bce1a14.aspx/
        		return env.merge(key => '/2009/10/28/pragmatic-thinking-and-learning-book-review-.html')
        	end        	
        	if path_info.downcase =~ /whatienjoyedatstackoverflowdevdaystoronto.aspx/ || path_info.downcase =~ /permalink,guid,c9b03db0-4375-426a-bd6c-21ba5aa2b726.aspx/
        		return env.merge(key => '/2009/10/25/what-i-enjoyed-at-stackoverflow-devdays-toronto-.html')
        	end        	
        	if path_info.downcase =~ /hornfirstimpressions.aspx/ || path_info.downcase =~ /permalink,guid,aa16764e-8120-4cd7-afea-e5ae1adc66fa.aspx/
        		return env.merge(key => '/2009/10/15/horn--first-impressions.html')
        	end        	
        	if path_info.downcase =~ /usingtheconnectionstringsectionforlog4netandnhibernate.aspx/ || path_info.downcase =~ /permalink,guid,357a3fbe-59e7-4dd4-846a-89083e903532.aspx/
        		return env.merge(key => '/2009/10/01/using-the-connection-string-section-for-log4net-and-nhibernate.html')
        	end        	
        	if path_info.downcase =~ /propernamingingenericsandlambdaexpressions.aspx/ || path_info.downcase =~ /permalink,guid,d3d599e3-d47f-4955-8598-ef241ab72997.aspx/
        		return env.merge(key => '/2009/09/19/proper-naming-in-generics-and-lambda-expressions-.html')
        	end        	
        	if path_info.downcase =~ /thepassionateprogrammerbookreview.aspx/ || path_info.downcase =~ /permalink,guid,10a36d05-75a6-44c3-a413-e10138b44001.aspx/
        		return env.merge(key => '/2009/09/10/the-passionate-programmer---book-review-.html')
        	end        	
        	if path_info.downcase =~ /morethanamonthwithoutpostingwow.aspx/ || path_info.downcase =~ /permalink,guid,d5078865-689f-4e3b-accd-2fb2d0f2fc19.aspx/
        		return env.merge(key => '/2009/09/09/more-than-a-month-without-posting---wow-.html')
        	end        	
        	if path_info.downcase =~ /usinggestaltinasitethatalreadyusesprototypejs.aspx/ || path_info.downcase =~ /permalink,guid,2dd734f6-b416-4cf1-bace-fd2e024f9fd9.aspx/
        		return env.merge(key => '/2009/07/23/using-gestalt-in-a-site-that-already-uses-prototype-js.html')
        	end        	
        	if path_info.downcase =~ /yellowstickynotesforyourwatchedvariablesinthenewvs2010.aspx/ || path_info.downcase =~ /permalink,guid,3bfd8a44-4504-4b7e-8016-a765cbdb6be7.aspx/
        		return env.merge(key => '/2009/07/22/yellow-sticky-notes-for-your-watched-variables-in-the-new-vs-2010.html')
        	end        	
        	if path_info.downcase =~ /supersimplesilverlightvideoplayerin20minuteswithatexteditorandgestalt.aspx/ || path_info.downcase =~ /permalink,guid,c757b2d0-7815-4f59-92f6-c26453fbb2e0.aspx/
        		return env.merge(key => '/2009/07/21/super-simple-silverlight-video-player-in-20-minutes-with-a-text-editor-and-gestalt-.html')
        	end        	
        	if path_info.downcase =~ /recordstepstoreproduceaproblemonwindows7.aspx/ || path_info.downcase =~ /permalink,guid,63cdd585-0a78-45f0-8a16-395291afc2f9.aspx/
        		return env.merge(key => '/2009/07/20/record-steps-to-reproduce-a-problem-on-windows-7-.html')
        	end        	
        	if path_info.downcase =~ /aresharpertemplateforusewithmigratornet.aspx/ || path_info.downcase =~ /permalink,guid,6549c523-74a0-4190-a48c-4eab32e8a8a4.aspx/
        		return env.merge(key => '/2009/07/16/a-resharper-template-for-use-with-migrator-net.html')
        	end        	
        	if path_info.downcase =~ /addinglinqpadtomytoolbox.aspx/ || path_info.downcase =~ /permalink,guid,0b19bc62-0799-4a6e-a38e-d28f6dedc7f1.aspx/
        		return env.merge(key => '/2009/07/14/adding-linqpad-to-my-toolbox-.html')
        	end        	
        	if path_info.downcase =~ /whatispronghornandwhyimdoingit.aspx/ || path_info.downcase =~ /permalink,guid,eb8717c4-6a67-42b3-ae80-333e6a4bc8f1.aspx/
        		return env.merge(key => '/2009/07/11/what-is-pronghorn-and-why-i’m-doing-it-.html')
        	end        	
        	if path_info.downcase =~ /integratesubversionwithvsforfreeonwindows7.aspx/ || path_info.downcase =~ /permalink,guid,37515a7b-e161-4288-b2d7-a17542737b79.aspx/
        		return env.merge(key => '/2009/07/08/integrate-subversion-with-vs-for-free-on-windows-7.html')
        	end        	
        	if path_info.downcase =~ /asimplesolutiontothebigfatcontrollerprobleminmvc.aspx/ || path_info.downcase =~ /permalink,guid,fc497741-559d-4ceb-a030-843132edc1e9.aspx/
        		return env.merge(key => '/2009/06/21/a-simple-solution-to-the-big-fat-controller-problem-in-mvc-.html')
        	end        	
        	if path_info.downcase =~ /makingsureyoursilverlight2widgetwillworkinacrossdomainscenario.aspx/ || path_info.downcase =~ /permalink,guid,9776f600-12a0-434b-a795-1411d933a65a.aspx/
        		return env.merge(key => '/2009/06/09/making-sure-your-silverlight-2-widget-will-work-in-a-cross-domain-scenario.html')
        	end        	
        	if path_info.downcase =~ /lightweighttestautomationframeworkjuneupdate.aspx/ || path_info.downcase =~ /permalink,guid,4635a159-fb27-445b-b1d3-35a05301790c.aspx/
        		return env.merge(key => '/2009/06/09/lightweight-test-automation-framework-june-update.html')
        	end        	
        	if path_info.downcase =~ /listofrecentinfoqvideosondesignarchitecturedslsandmore.aspx/ || path_info.downcase =~ /permalink,guid,7c1a87a7-eaaf-4b71-a22d-4854fc3234e3.aspx/
        		return env.merge(key => '/2009/06/04/list-of-recent-infoq-videos-on-design--architecture--dsl’s-and-more-.html')
        	end        	
        	if path_info.downcase =~ /vs2010generatemethodfromusage.aspx/ || path_info.downcase =~ /permalink,guid,5cc8f342-e9fa-4376-8dc3-cd8611ac6eb2.aspx/
        		return env.merge(key => '/2009/06/03/vs-2010--generate-method-from-usage-.html')
        	end        	
        	if path_info.downcase =~ /firstornullobjectextensionmethodforienumerableandfirstornew.aspx/ || path_info.downcase =~ /permalink,guid,36ca9278-2e4f-455b-94a5-c8c7257c16fc.aspx/
        		return env.merge(key => '/2009/05/27/firstornullobject-extension-method-for-ienumerable&lt;t&gt;-and-firstornew-.html')
        	end        	
        	if path_info.downcase =~ /tupleanewtypeonnet40.aspx/ || path_info.downcase =~ /permalink,guid,601b5987-9d65-477e-918d-e886533e7a2c.aspx/
        		return env.merge(key => '/2009/05/24/tuple--a-new-type-on--net-4-0.html')
        	end        	
        	if path_info.downcase =~ /torontocodecamp2009.aspx/ || path_info.downcase =~ /permalink,guid,af0d9322-91d9-4594-ad6e-6746739d06aa.aspx/
        		return env.merge(key => '/2009/05/02/toronto-code-camp-2009.html')
        	end        	
        	if path_info.downcase =~ /morefromoredev08ayendeonactiverecordtowritelesscode.aspx/ || path_info.downcase =~ /permalink,guid,e618197e-ab6a-4911-b8ad-b107eb18d098.aspx/
        		return env.merge(key => '/2009/04/24/more-from-oredev-08--ayende-on-activerecord-to-write-less-code-.html')
        	end        	
        	if path_info.downcase =~ /therenaissanceindevelopmenttednewardatoredev2008.aspx/ || path_info.downcase =~ /permalink,guid,62298148-1fb7-48a4-bd44-a6d7dd288586.aspx/
        		return env.merge(key => '/2009/04/23/the-renaissance-in-development-–-ted-neward-at-oredev-2008.html')
        	end        	
        	if path_info.downcase =~ /bulletpointspost.aspx/ || path_info.downcase =~ /permalink,guid,d441d782-e1fa-4a9f-a212-c5618941b898.aspx/
        		return env.merge(key => '/2009/04/21/bullet-points-post-.html')
        	end        	
        	if path_info.downcase =~ /extendingaspnetmvc.aspx/ || path_info.downcase =~ /permalink,guid,bccd525b-1c65-4b5d-8ac2-f4a8551aae4c.aspx/
        		return env.merge(key => '/2009/04/20/extending-asp-net-mvc.html')
        	end        	
        	if path_info.downcase =~ /silentlately.aspx/ || path_info.downcase =~ /permalink,guid,3d7a160b-94d4-4aab-8015-fd373aaaedbb.aspx/
        		return env.merge(key => '/2009/04/14/silent-lately.html')
        	end        	
        	if path_info.downcase =~ /whytestingsavestime.aspx/ || path_info.downcase =~ /permalink,guid,2388e1e5-c467-40de-8973-eb977364fca3.aspx/
        		return env.merge(key => '/2009/04/04/why-testing-saves-time-.html')
        	end        	
        	if path_info.downcase =~ /lightweighttestframeworkattachingtoanewwindowafterwindowopen.aspx/ || path_info.downcase =~ /permalink,guid,2fd1acc0-2518-48bc-923f-34e1f6599871.aspx/
        		return env.merge(key => '/2009/03/27/lightweight-test-framework--attaching-to-a-new-window-after-window-open.html')
        	end        	
        	if path_info.downcase =~ /lightweighttestframeworkfixinghowtohandlewindowopen.aspx/ || path_info.downcase =~ /permalink,guid,063ee100-37ec-4a57-b751-d8f0569f049c.aspx/
        		return env.merge(key => '/2009/03/24/lightweight-test-framework--fixing-how-to-handle-window-open.html')
        	end        	
        	if path_info.downcase =~ /microsoftlightweightautomationframeworkwritingyourtestsinadifferentweb.aspx/ || path_info.downcase =~ /permalink,guid,d133bd6a-081a-4b15-8e4b-defdc594524a.aspx/
        		return env.merge(key => '/2009/03/24/microsoft-lightweight-automation-framework--writing-your-tests-in-a-different-web.html')
        	end        	
        	if path_info.downcase =~ /microsoftlightweighttestautomationframeworkfixingwindowopenerrors.aspx/ || path_info.downcase =~ /permalink,guid,91498ef3-c9ae-4a21-90a5-d20bb39954f9.aspx/
        		return env.merge(key => '/2009/03/22/microsoft-lightweight-test-automation-framework--fixing-window-open-errors.html')
        	end        	
        	if path_info.downcase =~ /yahoocadoesntworkonie8bedefault.aspx/ || path_info.downcase =~ /permalink,guid,06803ac9-adfa-4d6e-a694-49f9865ca22e.aspx/
        		return env.merge(key => '/2009/03/21/yahoo-ca-doesn-t-work-on-ie8-be-default-.html')
        	end        	
        	if path_info.downcase =~ /theherdingcodenhibernateperformancepodcast.aspx/ || path_info.downcase =~ /permalink,guid,a3b15d49-cb70-4b75-8fe2-d73987a8d268.aspx/
        		return env.merge(key => '/2009/03/16/the-herding-code--nhibernate-performance-podcast.html')
        	end        	
        	if path_info.downcase =~ /howlinqworkslamdbasanonymousdelegatesandsomecompilervoodoo.aspx/ || path_info.downcase =~ /permalink,guid,091cb82a-2850-4818-a46d-6422386a2c7d.aspx/
        		return env.merge(key => '/2009/03/10/how-linq-works--lamdbas--anonymous-delegates-and-some-compiler-voodoo-.html')
        	end        	
        	if path_info.downcase =~ /rubymineanideforrubyrailsandsomuchmore.aspx/ || path_info.downcase =~ /permalink,guid,c3dcea9c-7c16-49c4-8c13-217500f1a75b.aspx/
        		return env.merge(key => '/2009/03/09/rubymine--an-ide-for-ruby--rails-and-so-much-more-.html')
        	end        	
        	if path_info.downcase =~ /nhibernateinactionfirstimpressions.aspx/ || path_info.downcase =~ /permalink,guid,e9d9330e-fd03-4b19-8ebe-df747bfa1199.aspx/
        		return env.merge(key => '/2009/03/08/nhibernate-in-action-–-first-impressions.html')
        	end        	
        	if path_info.downcase =~ /nullabletypeswhatsgoingonwhenyoudoint.aspx/ || path_info.downcase =~ /permalink,guid,e7a3f567-fb44-4651-a7ff-4f71e061009b.aspx/
        		return env.merge(key => '/2009/03/02/nullable-types--what’s-going-on-when-you-do-int-.html')
        	end        	
        	if path_info.downcase =~ /validatormovestoitsownpackage.aspx/ || path_info.downcase =~ /permalink,guid,cf185dee-1739-4df9-9f36-93149aaf915c.aspx/
        		return env.merge(key => '/2009/02/27/validator-moves-to-it’s-own-package.html')
        	end        	
        	if path_info.downcase =~ /refactoringandosprojecttake1.aspx/ || path_info.downcase =~ /permalink,guid,018a358c-4ceb-431f-b5f2-05efea180ff5.aspx/
        		return env.merge(key => '/2009/02/25/refactoring-and-os-project--take-1.html')
        	end        	
        	if path_info.downcase =~ /codingstandardsonateamandajournalistmanualofstyleandusages.aspx/ || path_info.downcase =~ /permalink,guid,e1212fd8-8675-4d67-b48e-dcf1777a661a.aspx/
        		return env.merge(key => '/2009/02/24/coding-standards-on-a-team-and-a-journalist-manual-of-style-and-usages.html')
        	end        	
        	if path_info.downcase =~ /aspnetmvcinactionchapters56and7.aspx/ || path_info.downcase =~ /permalink,guid,6a80225c-7244-458b-a3bd-d2c0876f162d.aspx/
        		return env.merge(key => '/2009/02/24/asp-net-mvc-in-action-chapters-5-6-and-7.html')
        	end        	
        	if path_info.downcase =~ /scottbellwareontwitter.aspx/ || path_info.downcase =~ /permalink,guid,b4f16982-85cb-4009-8734-9643012d8ee5.aspx/
        		return env.merge(key => '/2009/02/22/scott-bellware-on-twitter.html')
        	end        	
        	if path_info.downcase =~ /youcanonlyrefactorwhenyouhaveatestingsuite.aspx/ || path_info.downcase =~ /permalink,guid,aa12ce50-9df4-4cba-91fc-ec662f5d1693.aspx/
        		return env.merge(key => '/2009/02/21/you-can-only-refactor-when-you-have-a-testing-suite-.html')
        	end        	
        	if path_info.downcase =~ /autopropertiesincwhatthecompilerdoesforyou.aspx/ || path_info.downcase =~ /permalink,guid,9b073e21-fc69-4510-853e-521a0bac79ae.aspx/
        		return env.merge(key => '/2009/02/18/auto-properties-in-c-sharp--what-the-compiler-does-for-you-.html')
        	end        	
        	if path_info.downcase =~ /aspnetmvcinactionfirstimpressions.aspx/ || path_info.downcase =~ /permalink,guid,6a997cc6-3d9f-44c9-a4b4-6ed4bf38a396.aspx/
        		return env.merge(key => '/2009/02/16/asp-net-mvc-in-action--first-impressions-.html')
        	end        	
        	if path_info.downcase =~ /gurtleaccessyourgooglecodeissuetrackerfrominsidetortoisesvn.aspx/ || path_info.downcase =~ /permalink,guid,8f55d85e-6c0d-40e5-ae6c-d03076a54e95.aspx/
        		return env.merge(key => '/2009/02/15/gurtle--access-your-google-code-issue-tracker-from-inside-tortoisesvn.html')
        	end        	
        	if path_info.downcase =~ /moreunclebobvideos.aspx/ || path_info.downcase =~ /permalink,guid,3051a3af-453e-4950-aee3-1269dcd6969b.aspx/
        		return env.merge(key => '/2009/02/15/more-uncle-bob-videos-.html')
        	end        	
        	if path_info.downcase =~ /integratevisualstudiowithtortoisesvnforfree.aspx/ || path_info.downcase =~ /permalink,guid,044bd297-2b3a-4391-80ef-a87d94df926f.aspx/
        		return env.merge(key => '/2009/02/14/integrate-visual-studio-with-tortoisesvn-for-free.html')
        	end        	
        	if path_info.downcase =~ /videoofuncleboboncraftsmanshipanethics.aspx/ || path_info.downcase =~ /permalink,guid,e3455f06-ef9e-4c89-9f4e-09b063f09d02.aspx/
        		return env.merge(key => '/2009/02/13/video-of-uncle-bob-on-craftsmanship-an-ethics.html')
        	end        	
        	if path_info.downcase =~ /excellentpresentationonrestbystefantilkov.aspx/ || path_info.downcase =~ /permalink,guid,cc0b1053-cc06-4663-9b8d-d8259f67a1fc.aspx/
        		return env.merge(key => '/2009/02/12/excellent-presentation-on-rest-by-stefan-tilkov.html')
        	end        	
        	if path_info.downcase =~ /dependenciestothirdpartylibrariesattributesthekissofdead.aspx/ || path_info.downcase =~ /permalink,guid,4849f857-bff0-4fb9-8f75-70d908d0aeb4.aspx/
        		return env.merge(key => '/2009/02/11/dependencies-to-third-party-libraries;-attributes--the-kiss-of-dead-.html')
        	end        	
        	if path_info.downcase =~ /usingtestsasalearningtool.aspx/ || path_info.downcase =~ /permalink,guid,5e552373-b52d-4089-850b-50dbfd65aef0.aspx/
        		return env.merge(key => '/2009/02/10/using-tests-as-a-learning-tool.html')
        	end        	
        	if path_info.downcase =~ /theproblemwiththirdpartylibrariesexceptions.aspx/ || path_info.downcase =~ /permalink,guid,725599d2-1b6a-4c57-a0f7-f6ea11a393ee.aspx/
        		return env.merge(key => '/2009/02/10/the-problem-with-third-party-libraries;-exceptions-.html')
        	end        	
        	if path_info.downcase =~ /cruisecontrolnetbuildstationorhowtorunccnetinadevelopmentmachinewithoutiis.aspx/ || path_info.downcase =~ /permalink,guid,501aea5b-3a4e-47c9-8f9a-5574b8440ea1.aspx/
        		return env.merge(key => '/2009/02/09/cruisecontrol-net-build-station-or-how-to-run-cc-net-in-a-development-machine-without-iis.html')
        	end        	
        	if path_info.downcase =~ /elegantcodecastandabitabouttestingandtheroleofqa.aspx/ || path_info.downcase =~ /permalink,guid,4e0cedd2-b4da-4f0c-adb2-70128409e5c7.aspx/
        		return env.merge(key => '/2009/02/09/elegant-code-cast-and-a-bit-about-testing-and-the-role-of-qa.html')
        	end        	
        	if path_info.downcase =~ /jslintforvisualstudiokewanewnetlanguageandotherinterestingstufffoundoncodeplex.aspx/ || path_info.downcase =~ /permalink,guid,b55549d3-ea8e-4398-bac3-b74add2fc6f5.aspx/
        		return env.merge(key => '/2009/02/02/jslint-for-visual-studio--kew-a-new--net-language-and-other-interesting-stuff-found-on-codeplex.html')
        	end        	
        	if path_info.downcase =~ /haveyoueverwantedtolearnrailsbutyouneverwantedwheretostart.aspx/ || path_info.downcase =~ /permalink,guid,97853f7b-f421-4432-8e59-74c917c3aa91.aspx/
        		return env.merge(key => '/2009/01/24/have-you-ever-wanted-to-learn-rails-but-you-never-wanted-where-to-start-.html')
        	end        	
        	if path_info.downcase =~ /checkthatvalidationframeworkreworked.aspx/ || path_info.downcase =~ /permalink,guid,a95c5a54-c8d3-4acb-85dc-ea89a232d04b.aspx/
        		return env.merge(key => '/2009/01/23/check-that-validation-framework-reworked.html')
        	end        	
        	if path_info.downcase =~ /xgenoorgnewlightweightormmapper.aspx/ || path_info.downcase =~ /permalink,guid,7a97d9a3-9d88-4518-ab98-a5ab2875c6d6.aspx/
        		return env.merge(key => '/2009/01/22/xgeno-org-new-lightweight-orm-mapper-.html')
        	end        	
        	if path_info.downcase =~ /fubumvcnowrunsoncassini.aspx/ || path_info.downcase =~ /permalink,guid,60a01360-f3d7-4182-9520-a16f8d126d2f.aspx/
        		return env.merge(key => '/2009/01/17/fubumvc-now-runs-on-cassini---.html')
        	end        	
        	if path_info.downcase =~ /surfacedevelopmentatthemetrotorontonetusergroup.aspx/ || path_info.downcase =~ /permalink,guid,ccf9b2ce-f4e1-486c-a13b-a4c4c12cf045.aspx/
        		return env.merge(key => '/2009/01/16/surface-development-at-the-metro-toronto--net-user-group.html')
        	end        	
        	if path_info.downcase =~ /methodsandtoolsafreedevelopmentmagazine.aspx/ || path_info.downcase =~ /permalink,guid,2c0c0a5a-96ce-4a14-a299-caad68a4ca7f.aspx/
        		return env.merge(key => '/2009/01/16/methods-and-tools-a-free-development-magazine.html')
        	end        	
        	if path_info.downcase =~ /theherdingcodepodcastaboutfubumvc.aspx/ || path_info.downcase =~ /permalink,guid,628aee85-e5e1-4c14-84e3-5e7c90693c77.aspx/
        		return env.merge(key => '/2009/01/15/the-herding-code-podcast-about-fubumvc.html')
        	end        	
        	if path_info.downcase =~ /isolateyourselffromexternallibrariesusingthefacadepattern.aspx/ || path_info.downcase =~ /permalink,guid,f6cda480-8d8f-4ed4-b264-9a9b55293419.aspx/
        		return env.merge(key => '/2009/01/14/isolate-yourself-from-external-libraries-using-the-facade-pattern-.html')
        	end        	
        	if path_info.downcase =~ /newreleaseofccnetcommunitypluginsoncodeplex.aspx/ || path_info.downcase =~ /permalink,guid,79f8e7ea-90e7-4020-98c4-0ba254370ab6.aspx/
        		return env.merge(key => '/2009/01/14/new-release-of-cc-net-community-plugins-on-codeplex.html')
        	end        	
        	if path_info.downcase =~ /dslbookfrommartinfowler.aspx/ || path_info.downcase =~ /permalink,guid,24e89fde-727c-4afc-9110-ddeef915aa0c.aspx/
        		return env.merge(key => '/2009/01/13/dsl-book-from-martin-fowler.html')
        	end        	
        	if path_info.downcase =~ /fubumvcanothermvcframeworkfornet.aspx/ || path_info.downcase =~ /permalink,guid,6635551d-01d3-4208-a35c-f4d20a4b9a84.aspx/
        		return env.merge(key => '/2009/01/12/fubumvc-another-mvc-framework-for--net.html')
        	end        	
        	if path_info.downcase =~ /arantonprofessionalismbychadmyers.aspx/ || path_info.downcase =~ /permalink,guid,c11b36b3-0e94-4e74-a358-2661194fed3c.aspx/
        		return env.merge(key => '/2009/01/11/a-rant-on-professionalism-by-chad-myers.html')
        	end        	
        	if path_info.downcase =~ /xvalagoodvalidationframeworkforaspnetmvc.aspx/ || path_info.downcase =~ /permalink,guid,62286978-8261-41e9-a742-53e6dd28103c.aspx/
        		return env.merge(key => '/2009/01/11/xval-a-good-validation-framework-for-asp-net-mvc.html')
        	end        	
        	if path_info.downcase =~ /chromedoesntlikefeedscheme.aspx/ || path_info.downcase =~ /permalink,guid,8d304b7a-323d-408d-bafb-51f92c6a86f7.aspx/
        		return env.merge(key => '/2009/01/08/chrome-doesn-t-like-feed----scheme.html')
        	end        	
        	if path_info.downcase =~ /catharsisacompleteframeworkfordevelopingwebappsusingmvcandnhibernate20.aspx/ || path_info.downcase =~ /permalink,guid,5b05ca5f-80e7-4d00-9686-62332f42d72c.aspx/
        		return env.merge(key => '/2009/01/01/catharsis--a-complete-framework-for-developing-web-apps-using-mvc-and-nhibernate-2-0.html')
        	end        	
        	if path_info.downcase =~ /keepyourcontrollerslean.aspx/ || path_info.downcase =~ /permalink,guid,b40f26b7-4284-4119-a544-d9f2ecc03c9f.aspx/
        		return env.merge(key => '/2008/12/26/keep-your-controllers-lean-.html')
        	end        	
        	if path_info.downcase =~ /implementingavalidationclass.aspx/ || path_info.downcase =~ /permalink,guid,1c98a0cd-4c79-4acb-af8c-8b700bdd03e6.aspx/
        		return env.merge(key => '/2008/12/25/implementing-a-validation-class-.html')
        	end        	
        	if path_info.downcase =~ /myactualminimumrequirementsforaproject.aspx/ || path_info.downcase =~ /permalink,guid,89b5549c-7233-40c5-9991-4d7928b438f8.aspx/
        		return env.merge(key => '/2008/12/24/my-actual-minimum-requirements-for-a-project.html')
        	end        	
        	if path_info.downcase =~ /canagilekillaproject.aspx/ || path_info.downcase =~ /permalink,guid,61264dd3-3eca-4006-bca9-4da8a5c94334.aspx/
        		return env.merge(key => '/2008/12/23/can-agile-kill-a-project-.html')
        	end        	
        	if path_info.downcase =~ /continuousintegrationdosanddont.aspx/ || path_info.downcase =~ /permalink,guid,12de35b9-88b4-48a0-960b-1d0d989485a9.aspx/
        		return env.merge(key => '/2008/12/23/continuous-integration-do-s-and-don-t.html')
        	end        	
        	if path_info.downcase =~ /lostechiesishavingaveryinterestingseriesonkanban.aspx/ || path_info.downcase =~ /permalink,guid,7f07b88b-c97e-4055-a243-e12690276b3f.aspx/
        		return env.merge(key => '/2008/12/23/los-techies-is-having-a-very-interesting-series-on-kanban.html')
        	end        	
        	if path_info.downcase =~ /microsoftcodeanalysistoolcatidentifyvulnerabilitiesonyourcode.aspx/ || path_info.downcase =~ /permalink,guid,ae19dcc0-2457-406c-b597-829f36c741fd.aspx/
        		return env.merge(key => '/2008/12/22/microsoft-code-analysis-tool-(cat)-identify-vulnerabilities-on-your-code-.html')
        	end        	
        	if path_info.downcase =~ /aspnetmvcrc1comingnextjanuary.aspx/ || path_info.downcase =~ /permalink,guid,80c0841e-2e14-4f33-9cfd-5be93582f8dc.aspx/
        		return env.merge(key => '/2008/12/20/asp-net-mvc-rc-1-coming-next-january-.html')
        	end        	
        	if path_info.downcase =~ /sharparchitectureprojecttemplateinamachinewithoutaspnetmvcbetainstalled.aspx/ || path_info.downcase =~ /permalink,guid,39e90e60-79aa-4772-b00a-d581f3f7ab78.aspx/
        		return env.merge(key => '/2008/12/20/sharp-architecture-project-template-in-a-machine-without-asp-net-mvc-beta-installed.html')
        	end        	
        	if path_info.downcase =~ /sharparchitectureapproachingversion10.aspx/ || path_info.downcase =~ /permalink,guid,509262fc-e0eb-47ee-8f00-6ac648211106.aspx/
        		return env.merge(key => '/2008/12/19/sharp-architecture-approaching-version-1-0.html')
        	end        	
        	if path_info.downcase =~ /svnnotifierorkeepinguptodatewithyoursourcecontrolsystem.aspx/ || path_info.downcase =~ /permalink,guid,4bb2d0c6-2d70-4f06-b708-08a6e78cd06b.aspx/
        		return env.merge(key => '/2008/12/18/svn-notifier--or-keeping-up-to-date-with-your-source-control-system.html')
        	end        	
        	if path_info.downcase =~ /scoutpluginforresharpertonavigateyourcode.aspx/ || path_info.downcase =~ /permalink,guid,16dfc370-a34f-47ad-8a10-bb62256f05dd.aspx/
        		return env.merge(key => '/2008/12/18/scout-plug-in-for-resharper-to-navigate-your-code-.html')
        	end        	
        	if path_info.downcase =~ /bigvisiblecruisepatchtospecifyprojectsintheconfigurationfile.aspx/ || path_info.downcase =~ /permalink,guid,5d52f3b8-b4fa-4dd7-87ab-0953f1b7c3f3.aspx/
        		return env.merge(key => '/2008/12/16/big-visible-cruise-patch-to-specify-projects-in-the-configuration-file.html')
        	end        	
        	if path_info.downcase =~ /ourkanbanboardwentuptoday.aspx/ || path_info.downcase =~ /permalink,guid,9e0b28bb-ef1f-44a8-861c-0653c1f24a33.aspx/
        		return env.merge(key => '/2008/12/16/our-kanban-board-went-up-today-.html')
        	end        	
        	if path_info.downcase =~ /bigvisiblecruisecruisecontrolprojectstatusinabigscreen.aspx/ || path_info.downcase =~ /permalink,guid,c491af05-a3a4-415d-ba02-2fa837f8aeea.aspx/
        		return env.merge(key => '/2008/12/15/big-visible-cruise--cruise-control-project-status-in-a-big-screen.html')
        	end        	
        	if path_info.downcase =~ /elmaherrorhandlerforaspnetapplications.aspx/ || path_info.downcase =~ /permalink,guid,9265c5e7-1769-46b1-a8b1-f8cdebe7f6b6.aspx/
        		return env.merge(key => '/2008/12/15/elmah-error-handler-for-asp-net-applications.html')
        	end        	
        	if path_info.downcase =~ /ironpython20released.aspx/ || path_info.downcase =~ /permalink,guid,10df6702-73a1-4d45-a4d5-1157b34b6262.aspx/
        		return env.merge(key => '/2008/12/14/ironpython-2-0-released-.html')
        	end        	
        	if path_info.downcase =~ /thumbsuptobabysmash.aspx/ || path_info.downcase =~ /permalink,guid,7e7ec154-497e-485e-96d5-d704ed2b2192.aspx/
        		return env.merge(key => '/2008/12/13/thumbs-up-to-baby-smash.html')
        	end        	
        	if path_info.downcase =~ /researchontddbymicrosoft.aspx/ || path_info.downcase =~ /permalink,guid,a343d209-bbaf-4946-81bf-f3572c0abf4a.aspx/
        		return env.merge(key => '/2008/12/12/research-on-tdd-by-microsoft-.html')
        	end        	
        	if path_info.downcase =~ /goodbyebooksandbitshellodynamicprogrammer.aspx/ || path_info.downcase =~ /permalink,guid,87a0a186-acda-4dd1-848b-e8339656d607.aspx/
        		return env.merge(key => '/2008/12/12/goodbye-books-and-bits--hello-dynamic-programmer-.html')
        	end        	
        	if path_info.downcase =~ /pdc2009datesandmailinglist.aspx/ || path_info.downcase =~ /permalink,guid,d1f396af-e2a0-48cd-bdc2-b4c66be030ef.aspx/
        		return env.merge(key => '/2008/12/11/pdc-2009-dates-and-mailing-list-.html')
        	end        	
        	if path_info.downcase =~ /yagniitsnotaexcuseforbadlydesignedapplications.aspx/ || path_info.downcase =~ /permalink,guid,972d6190-b3e4-4c21-a89f-bcd3f0d99a96.aspx/
        		return env.merge(key => '/2008/12/11/yagni-it-s-not-a-excuse-for-badly-designed-applications-.html')
        	end        	
        	if path_info.downcase =~ /tadalistandchromeorhowtodogoodproducts.aspx/ || path_info.downcase =~ /permalink,guid,99.aspx/
        		return env.merge(key => '/2008/11/27/ta-da-list-and-chrome--or-how-to-do-good-products-.html')
        	end        	
        	if path_info.downcase =~ /ietesterfouriesinone.aspx/ || path_info.downcase =~ /permalink,guid,98.aspx/
        		return env.merge(key => '/2008/11/28/ie-tester---four-ie-s-in-one.html')
        	end        	
        	if path_info.downcase =~ /mediocrityshouldscareyou.aspx/ || path_info.downcase =~ /permalink,guid,97.aspx/
        		return env.merge(key => '/2008/11/26/mediocrity-should-scare-you-.html')
        	end        	
        	if path_info.downcase =~ /hurraytomyteam.aspx/ || path_info.downcase =~ /permalink,guid,96.aspx/
        		return env.merge(key => '/2008/11/25/hurray-to-my-team.html')
        	end        	
        	if path_info.downcase =~ /buildingtherightteam.aspx/ || path_info.downcase =~ /permalink,guid,95.aspx/
        		return env.merge(key => '/2008/11/25/building-the-right-team.html')
        	end        	
        	if path_info.downcase =~ /readingabookandsharingwithyourpairs.aspx/ || path_info.downcase =~ /permalink,guid,94.aspx/
        		return env.merge(key => '/2008/11/23/reading-a-book-and-sharing-with-your-pairs-.html')
        	end        	
        	if path_info.downcase =~ /watirtorunmysmokeandregressiontests.aspx/ || path_info.downcase =~ /permalink,guid,93.aspx/
        		return env.merge(key => '/2008/11/22/watir-to-run-my-smoke-and-regression-tests.html')
        	end        	
        	if path_info.downcase =~ /uskhayawebframeworkandaprogrammingexercise.aspx/ || path_info.downcase =~ /permalink,guid,92.aspx/
        		return env.merge(key => '/2008/11/22/uskhay-a-web-framework-and-a-programming-exercise.html')
        	end        	
        	if path_info.downcase =~ /usingextensionmethodsimprovingreadability.aspx/ || path_info.downcase =~ /permalink,guid,91.aspx/
        		return env.merge(key => '/2008/10/17/using-extension-methods--improving-readability-.html')
        	end        	
        	if path_info.downcase =~ /architecturebybaseball.aspx/ || path_info.downcase =~ /permalink,guid,90.aspx/
        		return env.merge(key => '/2008/09/05/architecture-by-baseball.html')
        	end        	
        	if path_info.downcase =~ /googlechromeandsilverlightitkindofworks.aspx/ || path_info.downcase =~ /permalink,guid,89.aspx/
        		return env.merge(key => '/2008/09/03/google-chrome-and-silverlight--it-kind-of-works---.html')
        	end        	
        	if path_info.downcase =~ /googlechromethenewkidinthebrowsersblock.aspx/ || path_info.downcase =~ /permalink,guid,87.aspx/
        		return env.merge(key => '/2008/09/03/google-chrome--the-new-kid-in-the-browsers-block.html')
        	end        	
        	if path_info.downcase =~ /moretoolstoformatccodeintohtml.aspx/ || path_info.downcase =~ /permalink,guid,77.aspx/
        		return env.merge(key => '/2008/08/29/more-tools-to-format-c-sharp-code-into-html.html')
        	end        	
        	if path_info.downcase =~ /doyouneedtoformatthecodeforyourblog.aspx/ || path_info.downcase =~ /permalink,guid,74.aspx/
        		return env.merge(key => '/2008/08/29/do-you-need-to-format-the-code-for-your-blog-.html')
        	end        	
        	if path_info.downcase =~ /narrangeorkeepingyourcodeinorderhowtorunitforonlyonefile.aspx/ || path_info.downcase =~ /permalink,guid,73.aspx/
        		return env.merge(key => '/2008/08/25/narrange-or-keeping-your-code-in-order--(how-to-run-it-for-only-one-file).html')
        	end        	
        	if path_info.downcase =~ /releaseofnewversionofverycoolsoftwarenhibernateandjsonnet.aspx/ || path_info.downcase =~ /permalink,guid,70.aspx/
        		return env.merge(key => '/2008/08/26/release-of-new-version-of-very-cool-software---nhibernate-and-json-net.html')
        	end        	
        	if path_info.downcase =~ /onsergiopereirasdonttellmeyoudidthatwithjavascript.aspx/ || path_info.downcase =~ /permalink,guid,69.aspx/
        		return env.merge(key => '/2008/08/22/on-sergio-pereira-s---don-t-tell-me-you-did-that-with-javascript.html')
        	end        	
        	if path_info.downcase =~ /videosoftheagile2008sessionsatinfoq.aspx/ || path_info.downcase =~ /permalink,guid,68.aspx/
        		return env.merge(key => '/2008/08/19/videos-of-the-agile-2008-sessions-at-infoq.html')
        	end        	
        	if path_info.downcase =~ /someinterestinglookingprojects2.aspx/ || path_info.downcase =~ /permalink,guid,67.aspx/
        		return env.merge(key => '/2008/08/16/some-interesting-looking-projects-2-.html')
        	end        	
        	if path_info.downcase =~ /theonionarchitectureandalayeredaproach.aspx/ || path_info.downcase =~ /permalink,guid,66.aspx/
        		return env.merge(key => '/2008/08/17/the-onion-architecture-and-a-layered-aproach.html')
        	end        	
        	if path_info.downcase =~ /someinterestinglookingcodeplexprojects.aspx/ || path_info.downcase =~ /permalink,guid,65.aspx/
        		return env.merge(key => '/2008/07/25/some-interesting-looking-codeplex-projects.html')
        	end        	
        	if path_info.downcase =~ /partcovernetandccnetpart2makingitpretty.aspx/ || path_info.downcase =~ /permalink,guid,60.aspx/
        		return env.merge(key => '/2008/06/12/partcover-net-and-cc-net-part-2---making-it-pretty-.html')
        	end        	
        	if path_info.downcase =~ /integratepartcovernetandcruisecontrolnet.aspx/ || path_info.downcase =~ /permalink,guid,57.aspx/
        		return env.merge(key => '/2008/06/11/integrate-partcover-net-and-cruise-control-net.html')
        	end        	
        	if path_info.downcase =~ /hanselminutesandthepassionforsoftwaredevelopment.aspx/ || path_info.downcase =~ /permalink,guid,56.aspx/
        		return env.merge(key => '/2008/06/04/hanselminutes-and-the-passion-for-software-development.html')
        	end        	
        	if path_info.downcase =~ /javascriptthegoodpartsthebook.aspx/ || path_info.downcase =~ /permalink,guid,55.aspx/
        		return env.merge(key => '/2008/06/04/javascript--the-good-parts--the-book-.html')
        	end        	
        	if path_info.downcase =~ /iis70andclassicaspcantcreatefolderoruploadfiles.aspx/ || path_info.downcase =~ /permalink,guid,54.aspx/
        		return env.merge(key => '/2008/05/29/iis-7-0-and-classic-asp-can-t-create-folder-(or-upload-files)-.html')
        	end        	
        	if path_info.downcase =~ /nantcustomtasktodeletemorethanonce.aspx/ || path_info.downcase =~ /permalink,guid,51.aspx/
        		return env.merge(key => '/2008/05/29/nant-custom-task-to-delete-more-than-once-.html')
        	end        	
        	if path_info.downcase =~ /nantbuildscriptstemplateforvisualstudio.aspx/ || path_info.downcase =~ /permalink,guid,50.aspx/
        		return env.merge(key => '/2008/05/18/nant-build-scripts-template-for-visual-studio.html')
        	end        	
        	if path_info.downcase =~ /aspnetdevelopmentserverinacustomport.aspx/ || path_info.downcase =~ /permalink,guid,43.aspx/
        		return env.merge(key => '/2008/05/17/asp-net-development-server-in-a-custom-port.html')
        	end        	
        	if path_info.downcase =~ /devteachthebestsessions1mvcsubmersion.aspx/ || path_info.downcase =~ /permalink,guid,42.aspx/
        		return env.merge(key => '/2008/05/16/devteach---the-best-sessions---1-(mvc-submersion).html')
        	end        	
        	if path_info.downcase =~ /restavideoaboutitandabooktorulethemall.aspx/ || path_info.downcase =~ /permalink,guid,41.aspx/
        		return env.merge(key => '/2008/05/14/rest--a-video-about-it--and-a-book-to-rule-them-all-.html')
        	end        	
        	if path_info.downcase =~ /devteachday1scotthanselmankeynote.aspx/ || path_info.downcase =~ /permalink,guid,40.aspx/
        		return env.merge(key => '/2008/05/13/devteach-day-1---scott-hanselman-keynote.html')
        	end        	
        	if path_info.downcase =~ /linqybatchofgoodnesstvbugmeetingwithscotthanselmann.aspx/ || path_info.downcase =~ /permalink,guid,39.aspx/
        		return env.merge(key => '/2008/05/13/linqy-batch-of-goodness---tvbug-meeting-with-scott-hanselmann.html')
        	end        	
        	if path_info.downcase =~ /heroeshappenheretoronto.aspx/ || path_info.downcase =~ /permalink,guid,38.aspx/
        		return env.merge(key => '/2008/02/27/heroes-happen-here---toronto.html')
        	end        	
        	if path_info.downcase =~ /testingyouraspnetpageswithnunitaspandnowebcontrols.aspx/ || path_info.downcase =~ /permalink,guid,37.aspx/
        		return env.merge(key => '/2008/01/21/testing-your-asp-net-pages-with-nunitasp-(and-no-web-controls).html')
        	end        	
        	if path_info.downcase =~ /thesmartbagtoreplacetheviewdataonmvc.aspx/ || path_info.downcase =~ /permalink,guid,36.aspx/
        		return env.merge(key => '/2008/01/20/the-smartbag-to-replace-the-viewdata-on-mvc.html')
        	end        	
        	if path_info.downcase =~ /cssparserclassinnet.aspx/ || path_info.downcase =~ /permalink,guid,35.aspx/
        		return env.merge(key => '/2008/01/20/css-parser-class-in--net.html')
        	end        	
        	if path_info.downcase =~ /partcoverthecodecoveragetoolforme.aspx/ || path_info.downcase =~ /permalink,guid,34.aspx/
        		return env.merge(key => '/2008/01/19/partcover-the-code-coverage-tool-for-me.html')
        	end        	
        	if path_info.downcase =~ /theimportanceofcodereview.aspx/ || path_info.downcase =~ /permalink,guid,33.aspx/
        		return env.merge(key => '/2008/01/09/the-importance-of-code-review.html')
        	end        	
        	if path_info.downcase =~ /freevirtualmachinesoftware.aspx/ || path_info.downcase =~ /permalink,guid,32.aspx/
        		return env.merge(key => '/2008/01/09/free-virtual-machine-software.html')
        	end        	
        	if path_info.downcase =~ /extendingthestringobjectinc.aspx/ || path_info.downcase =~ /permalink,guid,31.aspx/
        		return env.merge(key => '/2008/01/04/extending-the-string-object-in-c-sharp.html')
        	end        	
        	if path_info.downcase =~ /pspadeditorsandothertoolsthaticantleavewithout.aspx/ || path_info.downcase =~ /permalink,guid,30.aspx/
        		return env.merge(key => '/2008/01/05/pspad--editors-and-other-tools-that-i-can-t-leave-without-.html')
        	end        	
        	if path_info.downcase =~ /therubyandrailsidethatimiss.aspx/ || path_info.downcase =~ /permalink,guid,29.aspx/
        		return env.merge(key => '/2008/01/02/the-ruby-(and-rails)-ide-that-i-miss.html')
        	end        	
        	if path_info.downcase =~ /nant086beta1withsupportfor35isavailable.aspx/ || path_info.downcase =~ /permalink,guid,28.aspx/
        		return env.merge(key => '/2007/12/31/nant-0-86-beta-1-with-support-for-3-5-is-available.html')
        	end        	
        	if path_info.downcase =~ /learnaboutsql2008andvisualstudio2008forfree.aspx/ || path_info.downcase =~ /permalink,guid,27.aspx/
        		return env.merge(key => '/2007/12/30/learn-about-sql-2008-and-visual-studio-2008-for-free.html')
        	end        	
        	if path_info.downcase =~ /implementingtheeachmethodinccollections.aspx/ || path_info.downcase =~ /permalink,guid,26.aspx/
        		return env.merge(key => '/2007/12/31/implementing-the-each-method-in-c-sharp-collections.html')
        	end        	
        	if path_info.downcase =~ /anicelittlerubybook.aspx/ || path_info.downcase =~ /permalink,guid,25.aspx/
        		return env.merge(key => '/2007/12/30/a-nice-little-ruby-book.html')
        	end        	
        	if path_info.downcase =~ /netsimpletemplatingsystem2.aspx/ || path_info.downcase =~ /permalink,guid,24.aspx/
        		return env.merge(key => '/2007/12/28/-net-simple-templating-system-(2).html')
        	end        	
        	if path_info.downcase =~ /thesametemplateintheclientandserverside.aspx/ || path_info.downcase =~ /permalink,guid,22.aspx/
        		return env.merge(key => '/2007/12/25/the-same-template-in-the-client-and-server-side-.html')
        	end        	
        	if path_info.downcase =~ /linqtosearcharraysandautoimplementedproperties.aspx/ || path_info.downcase =~ /permalink,guid,20.aspx/
        		return env.merge(key => '/2007/12/25/linq-to-search-arrays-and-auto-implemented-properties-.html')
        	end        	
        	if path_info.downcase =~ /thefutureofc.aspx/ || path_info.downcase =~ /permalink,guid,19.aspx/
        		return env.merge(key => '/2007/12/25/the-future-of-c-sharp.html')
        	end        	
        	if path_info.downcase =~ /rubyonrails20.aspx/ || path_info.downcase =~ /permalink,guid,18.aspx/
        		return env.merge(key => '/2007/12/25/ruby-on-rails-2-0.html')
        	end        	
        	if path_info.downcase =~ /usinganexistingmodelwiththeaspmvcframework.aspx/ || path_info.downcase =~ /permalink,guid,17.aspx/
        		return env.merge(key => '/2007/12/23/using-an-existing-model-with-the-asp-mvc-framework.html')
        	end        	
        	if path_info.downcase =~ /usingmicrosoftaspnetmvcwithdoodads.aspx/ || path_info.downcase =~ /permalink,guid,16.aspx/
        		return env.merge(key => '/2007/12/23/using-microsoft-asp-net-mvc-with-doodads.html')
        	end        	
        	if path_info.downcase =~ /fixingiis50toworkwiththemvc.aspx/ || path_info.downcase =~ /permalink,guid,15.aspx/
        		return env.merge(key => '/2007/12/11/fixing-iis-5-0-to-work-with-the-mvc.html')
        	end        	
        	if path_info.downcase =~ /microsoftmvcframeworkavailable.aspx/ || path_info.downcase =~ /permalink,guid,14.aspx/
        		return env.merge(key => '/2007/12/11/microsoft-mvc-framework-available.html')
        	end        	
        	if path_info.downcase =~ /microsoftvoltaairnet.aspx/ || path_info.downcase =~ /permalink,guid,13.aspx/
        		return env.merge(key => '/2007/12/07/microsoft-volta---air-net-.html')
        	end        	
        	if path_info.downcase =~ /arestapiin20minutespart2.aspx/ || path_info.downcase =~ /permalink,guid,11.aspx/
        		return env.merge(key => '/2007/12/08/a-rest-api-in-20-minutes---part-2.html')
        	end        	
        	if path_info.downcase =~ /arestapiin20minutespart1.aspx/ || path_info.downcase =~ /permalink,guid,10.aspx/
        		return env.merge(key => '/2007/12/08/a-rest-api-in-20-minutes---part-1.html')
        	end        	
        	if path_info.downcase =~ /microsoftmvccomingalong.aspx/ || path_info.downcase =~ /permalink,guid,9.aspx/
        		return env.merge(key => '/2007/12/08/microsoft-mvc-coming-along-.html')
        	end        	
        	if path_info.downcase =~ /applyingbddtorequirementsgathering.aspx/ || path_info.downcase =~ /permalink,guid,8.aspx/
        		return env.merge(key => '/2007/12/08/applying-bdd-to-requirements-gathering-.html')
        	end        	
        	if path_info.downcase =~ /prototypeandscriptaculouspresentation.aspx/ || path_info.downcase =~ /permalink,guid,7.aspx/
        		return env.merge(key => '/2007/10/27/prototype-and-script-aculo-us-presentation.html')
        	end        	
        	if path_info.downcase =~ /whyyouneedtouseagoodarchitecturewhenwritingjavascript.aspx/ || path_info.downcase =~ /permalink,guid,6.aspx/
        		return env.merge(key => '/2007/10/27/why-you-need-to-use-a-good-architecture-when-writing-javascript.html')
        	end        	
        	if path_info.downcase =~ /mvcframeworkinnetbymicrosoft.aspx/ || path_info.downcase =~ /permalink,guid,5.aspx/
        		return env.merge(key => '/2007/10/12/mvc-framework-in--net-by-microsoft.html')
        	end        	
        	if path_info.downcase =~ /suportingwminfirefox.aspx/ || path_info.downcase =~ /permalink,guid,4.aspx/
        		return env.merge(key => '/2007/10/11/suporting-wm-in-firefox.html')
        	end        	
        	if path_info.downcase =~ /altnet.aspx/ || path_info.downcase =~ /permalink,guid,3.aspx/
        		return env.merge(key => '/2007/10/06/alt-net.html')
        	end        	
        	if path_info.downcase =~ /flexversusajax.aspx/ || path_info.downcase =~ /permalink,guid,2.aspx/
        		return env.merge(key => '/2007/09/09/flex-versus-ajax.html')
        	end        	
        	if path_info.downcase =~ /ajaxhacks.aspx/ || path_info.downcase =~ /permalink,guid,1.aspx/
        		return env.merge(key => '/2007/08/20/ajax-hacks.html')
        	end
            env.merge(key => path_info + @try[@next])
        end

    end
end

use Rack::TryStatic, 
    :root => "_site",                              # static files root dir
    :urls => %w[/],                                 # match all requests 
    :try => ['.html', 'index.html', '/index.html']  # try these postfixes sequentially

errorFile='_site/index.html'
run lambda { [404, {
                "Last-Modified"  => File.mtime(errorFile).httpdate,
                "Content-Type"   => "text/html",
                "Content-Length" => File.size(errorFile).to_s
            }, File.read(errorFile)] }
