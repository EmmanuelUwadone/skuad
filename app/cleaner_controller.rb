class CleanerController

  def clean_params(array)
    array.collect(&:strip!)
  end

end