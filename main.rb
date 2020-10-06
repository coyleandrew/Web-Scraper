command, *args = ARGV

load 'search.rb'
load 'sanitizer.rb'
load 'netnutritionclient.rb'

class Main
    include ItemsDb

    def initialize(command, args)
        # search, update, etc
        @command = command.chomp.downcase
        # you know, just command args
        @args = args

        # create services
        @menuClient = NetNutritionClient.new
        @search = Search.new
        @sanitizer = Sanitizer.new
    end

    # Determine what to do
    def run
        case @command
        when "update"
            puts "Do upading database."
        when "search"
            puts "Do args version of search"
        else
            puts "Do check for database file"

            # init interactive search
            @search.main
        end

    end

end

# Create the main instance
main = Main.new(command ||= "", args)
main.run

