class Term
  @@all_terms = []

  define_method(:initialize) do |new_term, definition|
    @new_term = new_term
    @definition = definition
    @id = @@all_terms.length().+(1)
  end

  define_method(:new_term) do
    @new_term
  end

  define_method(:definition) do
    @definition
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@all_terms
  end

  define_method(:save) do
    @@all_terms.push(self)
  end

  define_singleton_method(:clear) do
    @@all_terms = []
  end

  define_singleton_method(:find) do |identification|
    found_term = nil
    @@all_terms.each() do |term|
      if term.id().eql?(identification.to_i())
        found_term = term
      end
    end
    found_term
  end
end
