FactoryBot.define do
  factory :emploi do
    produit { nil }
    type_contrat { 1 }
    lieu { "MyString" }
    secteur_activite { "MyString" }
    niveau_experience { 1 }
    date_limite { "2024-11-01" }
    salaire { "9.99" }
    site_web { "MyText" }
    formation_requise { "MyText" }
    etat_offre { 1 }
  end
end
