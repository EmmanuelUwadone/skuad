class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    
    puts "\n"
    @cleaner = CleanerController.new
    array2= @cleaner.clean_params (params[:dollar_format].split('$'))

    city2 = array2[0]
    birthdate2= array2[1]
    last_name2= array2[2]
    first_name2 = array2[3].split("\n")[0]
    la = array2[3].split("\n")[1]

    date3 = array2[4]
    nolan = array2[5]
    rhia = array2[6].split("\n")[0]
    nyc = array2[6].split("\n")[1]
    date4 = array2[7]
    bruen = array2[8]
    rigo = array2[9].split("\n")[0]

    
    #puts params[:order]
    
    array= @cleaner.clean_params (params[:percent_format].split('%'))
    first_name = array[0]
    city= array[1]
    birthdate = array[2].split("\n")[0]
    mckayla = array[2].split("\n")[1]

    atlanta = array[3]
    date = array[4].split("\n")[0]
    elliot = array[4].split("\n")[1]
    new_york = array[5]
    date2 = array[6].split("\n")[0]


    
    puts "\n"
    @code = CodeController.new
    la= @code.add_community(la)


    return eval(%q{["#{elliot}, #{new_york}, #{compute(date2)}","#{mckayla}, #{atlanta}, #{compute(date)}","#{rhia}, #{la}, #{compute(date3)}","#{rigo}, #{new_york}, #{compute(date4)}"]})
    

    

  end

  private

  def compute(date)
    if date.split('-')[1].sub!(/^0+/,'') && date.split('-')[2].sub!(/^0+/,'')
      date.split('-')[1].sub!(/^[0]+/,'') + "/" +  date.split('-')[2].sub!(/^0+/,'') + "/" + date.split('-')[0].slice(0,4)
    elsif date.split('-')[2].sub!(/^0+/,'')
      date.split('-')[1] + "/" +  date.split('-')[2].sub!(/^0+/,'') + "/" + date.split('-')[0].slice(0,4)
    elsif date.split('-')[1].sub!(/^0+/,'')
      date.split('-')[1].sub!(/^0+/,'') + "/" +  date.split('-')[2] + "/" + date.split('-')[0].slice(0,4)
    else
      date.split('-')[1] + "/" + date.split('-')[0].slice(0,4) + "/"  + date.split('-')[2]
    end
    
  end

  attr_reader :params
end
