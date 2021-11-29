class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    
    puts "\n"
    array2= params[:dollar_format].split('$')
    array2.collect(&:strip!)

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

      


    puts "\n"
    puts params[:order]
    puts "\n"
    array= params[:percent_format].split('%')
    array.collect(&:strip!)
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

    redirect_to date_controller

    if la
      la='Los Angeles'
    end
    
    a = [elliot,new_york,compute(date2)]
    puts a.join(', ')

    b = [mckayla,atlanta,compute(date)]
    puts b.join(', ')

    c = [rhia,'Los Angeles',compute(date3)]
    puts c.join(', ')

    

    d = [rigo,new_york,compute(date4)]
    puts d.join(', ')

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


# first_name % city % birthdate
# Mckayla % Atlanta % 1986-05-29
# Elliot % New York City % 1947-05-04