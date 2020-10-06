command, *args = ARGV

load 'search.rb'
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
    end

    # Determine what to do
    def run
        case @command
        when "update"
            puts "Updating database"
            update_database
        when "search"
            # Make sure the database exists
            ensure_database
            @search.do_search(@args[0], @args[1])
        when ""
            # Make sure the database exists
            ensure_database
            @search.main
        else
            puts "Invalid command, please try again."
        end

    end

    # Restore the database in case it goes missing.
    def ensure_database
        unless File.exist?("./items.csv")
            puts "Restoring items database."
            update_database
        end
    end

    def update_database
        items = @menuClient.scrape
            self.save_items("./items.csv", items)
    end

end

# Create the main instance
main = Main.new(command ||= "", args)
main.run

