class Array

  def custom_flatten(nested_array = self)
    nested_array.each_with_object([]) do |element, flattened_array|
      new_element = element.is_a?(Array) ? custom_flatten(element) : element
      flattened_array.push *new_element
    end
  end

end
