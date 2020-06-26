# Task 1
module Example
  class << self
    def percent(total, value)
      total = convert_to_float(total)
      value = convert_to_float(value)

      percent_value = (value / total) * 100
      percent_value.round(2)
    end

    def reverse_long_words(string)
      return "#{string} isn't a string" unless string.is_a?(String)

      string.gsub(/\b\w{5,}\b/, &:reverse)
    end

    def split_number(number)
      return "#{number} isn't a Integer" unless number.is_a?(Integer)

      number.digits.each_with_index.map { |n, i| n * 10**i }.reject(&:zero?).reverse.join(' + ')
    end

    def alphabet_position(text)
      return "#{text} isn't a String" unless text.is_a?(String)

      text.gsub(/[^a-zA-Z]/, '').downcase.split('').map { |letter| check_number(letter) }.join(' ')
    end

    private

    def convert_to_float(number)
      return "#{number} is not a number" unless number.is_a?(Integer) || number.is_a?(Float)

      number.to_f
    end

    def check_number(letter)
      'abcdefghijklmnopqrstuvwxyz'.split('').index(letter) + 1
    end
  end
end

# Task 2

class Patient
  # last_name should use '=' sign instead of ':' and id symbol should be the last parameter
  # Id should have a default value set to nil
  def initialize(id:, first_name = nil, last_name: nil)
    @id = id
    # First name should be named first_name (should use snake_case)
    @firstName = first_name
    @last_name = last_name
  end

  # By the look how patient? method is being triggered is should be without self
  def self.patient?(id)
    # It should check if it's the same value
    # that's I would change it from '!=' to '=='
    id != @id
  end

  def full_name
    # Instace variables should be used here so instead of using
    # firstName and last_name it should be @first_name and @last_name
    # also there should be a space between two strings
    firstName + last_name
  end
end

# My implementation
class Patient
  def initialize(first_name = nil, last_name = nil, id: nil)
    @id = id
    @first_name = first_name
    @last_name = last_name
  end

  def patient?(id)
    id == @id
  end

  def full_name
    [@first_name, @last_name].compact.join(" ")
  end
end

patient_1 = Patient.new(id: "123")
patient_1.patient?("123")
patient_1.full_name
patient_2 = Patient.new("Karol", "Tychek")
patient_2.patient?("123")
patient_2.full_name
# As I mentioned above keyword arguments should be passed as the last parameter
# that's why I would change to look like this 'patient_3 = Patient.new("Roman", id: "123")'
patient_3 = Patient.new(id: "123", "Roman")
patient_3.patient?("Roman")
patient_3.full_name
