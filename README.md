Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.


Step :
1/
 bundle install
 2/
 yarn install

3/ 
rails db:create
rails db:migrate
rails db:seed

4/
rails s

heroku run rake db:migrate --app staging-ruby-hesias
heroku run rake db:drop --app staging-ruby-hesias



outil pdf pour imprimer les produit
boutons filtre neuf occas reco



rails generate model productDeliveryDate deliveryDate:date archive:boolean       
rails generate migration RemoveDeliveryDateToProduct product:references	
rails generate migration AddDeliveryDateReferenceToProduct product:references	
rails generate controller ProductDeliveryDate index new create update edit destroy  --no-assets --no-helper		
		

rails generate migration DropTableDeliveryDateToProduct productDateDelivery:references	
		
				
		
		