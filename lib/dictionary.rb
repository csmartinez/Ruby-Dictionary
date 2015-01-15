class Dictionary
  @@dictionaries = []

  define_method(:initialize) do |name|
    @name = name
    @terms = []
    @id = @@dictionaries.length().+(1)
  end

  define_method(:name) do
    @name
  end

  define_method(:terms) do
    @terms
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@dictionaries
  end

  define_method(:save) do
    @@dictionaries.push(self)
  end

  define_singleton_method(:clear) do
    @@dictionaries = []
  end

  define_singleton_method(:find) do |id|
    found_dictionary = nil
    @@dictionaries.each() do |dictionary|
      if dictionary.id().eql?(id)
        found_dictionary = dictionary
      end
    end
    found_dictionary
  end

  define_method(:add_term) do |term|
    @terms.push(term)
  end
end
