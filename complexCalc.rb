class ComplexNumber
    attr_accessor :real , :img
    @@add_count = 0
    @@multiply_count = 0
    @@add_bulk_count = 0
    @@multiply_bulk_count = 0
    def initialize(real , img)
        @real = real
        @img = img
        
    end

    def +(other)
        @@add_count +=1
        ComplexNumber.new(@real + other.real , @img + other.img)
    end

    def *(other)
        @@multiply_count +=1
        ComplexNumber.new((@real*other.real)-(@img*other.img) , (@real*other.img)+(@img*other.real))
    end


    def self.bulk_add(arr)
        @@add_bulk_count += 1
        bulkAddedCn = ComplexNumber.new(0,0)
        arr.each { |other|
            bulkAddedCn = bulkAddedCn + other
        }
        bulkAddedCn
    end



    def self.bulk_multiply(arr)
        @@multiply_bulk_count +=1
        bulkMultipliedCn = ComplexNumber.new(1,1)
        arr.each do |other| 
            bulkMultipliedCn =  bulkMultipliedCn * other 
        end
        bulkMultipliedCn 
    end

    def self.get_stats()
        puts " Add function is used #{@@add_count} times.\n Multiply function is used #{@@multiply_count} times.\n Add Bulk function is used #{@@add_bulk_count} times.\n Multiply Bulk function is used #{@@multiply_bulk_count} times."
    end
    
    def to_s
        return "#{@real} + #{@img}i"
    end
    
    
end

complex1 = ComplexNumber.new(3,2)
complex2 = ComplexNumber.new(1,7)
complex3 = ComplexNumber.new(4,5)
puts ComplexNumber.bulk_add([complex1,complex2])
ComplexNumber.get_stats
