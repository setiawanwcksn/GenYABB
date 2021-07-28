class App
    def increment(input)
        new_array = input[0..-2] + [input[-1] + 1]
        if new_array[-1] == 10
            if new_array.length == 1
                return [1, 0]
            else
                 return [new_array[0] + 1, 0]
            end
        end
        new_array
    end
end