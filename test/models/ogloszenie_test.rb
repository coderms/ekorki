require 'test_helper'

class OgloszenieTest < ActiveSupport::TestCase
  test "Zapis ogłoszenia do bazy danych" do
    o = Ogloszenie.new
    o.tytul = 'max work'
    o.opis = 'opis ogloszenia'
    o.telefon = '123 456 789'
    o.imie = 'Max'
    o.nazwisko = 'Kolonko'
    o.email = 'max.kolonko@swing.pl'
    o.kategoria = 'cat_1_2'
    assert o.save
  end
end
