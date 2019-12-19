class Printer

    def self.format_numbers(list)
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

    def self.print_formatted_list(list)
        formatted_list = [['date || credit || debit || balance']]
        format_numbers(list).map do |string|
            formatted_list.insert(-1, string.join(" "))
        end 
        puts formatted_list
    end

end