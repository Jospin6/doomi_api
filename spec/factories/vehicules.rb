FactoryBot.define do
  factory :vehicule do
    produit { nil }
    modele { "MyString" }
    annee { 1 }
    kilometrage { "MyString" }
    type_vehicule { 1 }
    couleur { "MyString" }
    carburant { 1 }
    transmission { "MyString" }
    nombre_portes { 1 }
    nombre_places { 1 }
    statut { 1 }
    plan_de_paiement { 1 }
    disponibilite { 1 }
  end
end
