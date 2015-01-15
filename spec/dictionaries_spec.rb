require('rspec')
require('definitions')
require('dictionary')

describe(Dictionary) do
  before() do
    Dictionary.clear()
  end

  describe('#name') do
    it("returns the name of the dictionary") do
      test_dictionary = Dictionary.new("Encyclopedia of Food Carts")
      expect(test_dictionary.name()).to(eq("Encyclopedia of Food Carts"))
    end
  end

  describe('#id') do
    it("returns the id of the dictionary") do
      test_dictionary = Dictionary.new("Encyclopedia of Food Carts")
      expect(test_dictionary.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Dictionary.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a dealership to the array of saved dictionaries") do
      test_dictionary = Dictionary.new("Encyclopedia of Food Carts")
      test_dictionary.save()
      expect(Dictionary.all()).to(eq([test_dictionary]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved dictionaries") do
      Dictionary.new("Encyclopedia of Food Carts").save()
      Dictionary.clear()
      expect(Dictionary.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a dictionary by its id number") do
      test_dictionary = Dictionary.new("Encyclopedia of Food Carts")
      test_dictionary.save()
      test_dictionary2 = Dictionary.new("The Slang Dictionary")
      test_dictionary2.save()
      expect(Dictionary.find(test_dictionary.id())).to(eq(test_dictionary))
    end
  end
end
