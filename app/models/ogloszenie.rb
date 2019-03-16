class Ogloszenie < ActiveRecord::Base
  self.table_name = "ogloszenia"
  # attr_accessor :tytul, :opis, :telefon
  
  def plany_zajec
    PlanZajec.where("ogloszenie_id = ?", self.id)
  end
  
  def pon
    plany_zajec.select {|plan| plan[:dzien_tyg] == 'Poniedziałek' }.any?
  end
  
  def wt
    plany_zajec.select {|plan| plan[:dzien_tyg] == 'Wtorek' }.any?
  end
  
  def sr
    plany_zajec.select {|plan| plan[:dzien_tyg] == 'Środa' }.any?
  end
  
  def czw
    plany_zajec.select {|plan| plan[:dzien_tyg] == 'Czwartek' }.any?
  end
  
  def pt
    plany_zajec.select {|plan| plan[:dzien_tyg] == 'Piątek' }.any?
  end
  
  def sob
    plany_zajec.select {|plan| plan[:dzien_tyg] == 'Sobota' }.any?
  end
  
  def nie
    plany_zajec.select {|plan| plan[:dzien_tyg] == 'Niedziela' }.any?
  end
end
