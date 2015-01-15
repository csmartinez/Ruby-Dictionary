require('rspec')
require('definitions')

describe(Term) do
  before() do
    Term.clear()
  end

  describe('#new_term') do
    it("returns the term") do
      test_new_term = Term.new("Candy", "things I should not eat")
      test_new_term.save()
      expect(test_new_term.new_term()).to eq("Candy")
    end
  end

  describe('#definition') do
    it("returns the definition of the term") do
      test_new_term = Term.new("Candy", "things I should not eat")
      test_new_term.save()
      expect(test_new_term.definition()).to eq("things I should not eat")
    end
  end

describe("#id") do
  it("returns the id of the term") do
    test_new_term = Term.new("Candy", "things I should not eat")
    test_new_term.save()
    expect(test_new_term.id()).to eq(1)
  end
end

  describe(".all") do
    it("is empty at first") do
      expect(Term.all()).to eq([])
    end
  end

  describe("#save") do
    it("saves terms into an array") do
      test_new_term = Term.new("Candy", "things I should not eat")
      test_new_term.save()
      expect(Term.all()).to eq([test_new_term])
    end
  end

  describe('#clear') do
    it("empties out all of the saved terms") do
      Term.new("Candy", "things I should not eat").save()
      Term.clear()
      expect(Term.all()).to eq([])
    end
  end

  describe(".find") do
    it("returns a dictionary by its id number") do
      test_dictionary = Term.new("Candy", "things I should not eat")
      test_dictionary.save()
      test_dictionary2 = Term.new("totes", "absolutely all of the things")
      test_dictionary2.save()
      expect(Term.find(test_dictionary.id())).to(eq(test_dictionary))
    end
  end


end
