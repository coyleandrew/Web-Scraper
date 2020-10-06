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
            items = @menuClient.scrape
            self.save_items("./items.csv", items)
        when "search"
            @search.do_search(@args[0], @args[1])
        when ""
            @search.main
        else
            puts "Invalid command, please try again."
        end

    end

end

# Create the main instance
main = Main.new(command ||= "", args)
main.run

