# frozen_string_literal: true

# 1. დავაყენოთ და გავმართოთ RSpec პროექტში ისე, რომ result_spec.rb გაეშვას.

# 2.
# Result კლასში, @methods მასივში არის აღწერილი 6 მეთოდი.

# Result.new.call(record)
# გაშვების დროს, call-ში, გადაეცემა ან Array ან Hash, და ენიჭება record ცვლადს.

# ამონაცა:

# უნდა გავუშვათ ყველა მეთოდი ამ record-ზე, რომელიც არის აღწერილი @methods მასივში.

# თუ record ობიექს შეუძლია გაშვება, დავამათოთ გაშვების რეზულტატი მასივში, იმ პირობით:

# თუ record - array, თითო მეთოდის გამოძახების შედეგად უნდა შეიქმნას ახალი array და დააბრუნოს მასივი სადაც ყველა ელემენტი იქნება array

# methods = ['operation1', 'operation2', 'operation2']

# record = [] (array)

# [
#   ['result of operation1'],
#   ['result of operation2'],
#   ['result of operation3'],
# ]

# თუ record - hash, თითო მეთოდის გამოძახების შედეგად უნდა შეიქმნას hash და დააბრუნოს მასივი სადაც ყველა ელემენტი იქნება hash
# methods = ['operation1', 'operation2', 'operation2']

# record = {} (hash)
# [
#   { 'result of operation1': 'result of operation1' },
#   { 'result of operation2': 'result of operation2' },
#   { 'result of operation3': 'result of operation3' },
# ]

# Documentation
class Result
  def initialize
    @methods = %w[reverse invert pop zip merge to_f]
  end

  def call(record)
    record_array = []
    array_result = 0
    @methods.each do |method|
      case record
      when Array
        record1 = []
        record1.push(record.send(method))
        record_array.push(record1)
        array_result = record_array
      when Hash
        record_hash = record.send(method)
        record_array.push(Hash[record_hash])
        array_result = record_array
      end
    rescue StandardError
    end
    p array_result
  end
end
