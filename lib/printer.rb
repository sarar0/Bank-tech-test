class Printer
    def initialize
        @statement_columns = ['date || credit || debit || balance']
    end
  
    def format_numbers(list)
        list.map do |element|
            element.map do |item| 
                if item.is_a?(Numeric) 
                    item = format('%.2f', item)
                elsif item.is_a?(String)
                    item = item.gsub(/-/, '/')
                else
                    item
                end
            end
        end
    end

    def print_formatted_list(list)
        formatted_list = []
        format_numbers(list).map do |string|
            formatted_list.push(string.join(" "))
        end 
        puts formatted_list.unshift(@statement_columns)
    end

end