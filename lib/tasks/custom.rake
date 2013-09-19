namespace :custom do
  desc "Generates scaffold with I18 variables."
  task :scaffold, [:model, :params] => :environment   do  |t, args|
    model = args.model
    
    p "Starting rake to generate #{model} scaffold......"
    p "Generating scaffold......"
    system("rails g scaffold #{args.model} #{args.params}")
    p "Migrating to database......"
    system("rake db:migrate")
    @locales = Dir['config/locales/*.yml'].map { |f| File.basename(f) }
    @locales.each do |locale|
      if locale.split(".")[0] != "devise"
        
        models = "#{model}: '#{model.humanize.titlecase}'\n" +
          "\t\t\t#{model.pluralize}: '#{model.pluralize.humanize.titlecase}'" +
          "\n\t\t\t#END OF MODELS DO NOT DELETE OR MOVE OR TAB THIS COMMENT"
        p "Appending model variables to #{locale}......"
        model_file1 = File.read("#{Rails.root}/config/locales/#{locale}")
        file1 = File.open("#{Rails.root}/config/locales/#{locale}","w")
        file1.write(model_file1.gsub(/#END OF MODELS DO NOT DELETE OR MOVE OR TAB THIS COMMENT/, models))
        file1.close 
        
        
        @model = eval("#{model}".camelize)
        #coulums = @model.column_names.delete[0]
        form_variables = model + ":\n" 
        @model.column_names.each do |column|
          form_variables += "\t\t\t\t" + column.to_s + ": '#{column.to_s.humanize.titlecase}: '\n"
        end
        form_variables += "\t\t  #END OF FORM VARIABLES DO NOT DELETE OR MOVE OR TAB THIS COMMENT"
        model_file2 = File.read("#{Rails.root}/config/locales/#{locale}")
        file2 = File.open("#{Rails.root}/config/locales/#{locale}","w")
        file2.write(model_file2.gsub(/#END OF FORM VARIABLES DO NOT DELETE OR MOVE OR TAB THIS COMMENT/, form_variables))        
        file2.close     
        
        views_variables = model.pluralize + ":\n" 
        views_variables += "\t  show:\n"        
        @model.column_names.each do |column|
          views_variables += "\t\t\t" + column.to_s + ": '#{column.to_s.humanize.titlecase}: '\n"
        end
        views_variables += "\t  index:\n"        
        @model.column_names.each do |column|
          views_variables += "\t\t\t" + column.to_s + ": '#{column.to_s.humanize.titlecase}'\n"
        end
        views_variables += "\t#END OF VIEWS VARIABLES DO NOT DELETE OR MOVE OR TAB THIS COMMENT"
        model_file3 = File.read("#{Rails.root}/config/locales/#{locale}")
        file3 = File.open("#{Rails.root}/config/locales/#{locale}","w")
        file3.write(model_file3.gsub(/#END OF VIEWS VARIABLES DO NOT DELETE OR MOVE OR TAB THIS COMMENT/, views_variables))        
        file3.close 
        
        
      end
    end	
  end
  
end