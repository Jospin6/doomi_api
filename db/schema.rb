# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_12_25_154716) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "a_la_unes", force: :cascade do |t|
    t.string "a_la_uneable_type"
    t.integer "a_la_uneable_id"
    t.bigint "user_id", null: false
    t.datetime "date_debut"
    t.datetime "date_fin"
    t.decimal "cout"
    t.string "statut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_a_la_unes_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "autre_produit_attributs", force: :cascade do |t|
    t.bigint "produit_id", null: false
    t.integer "etat"
    t.string "marque"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produit_id"], name: "index_autre_produit_attributs_on_produit_id"
  end

  create_table "boosts", force: :cascade do |t|
    t.string "boostable_type"
    t.integer "boostable_id"
    t.bigint "user_id", null: false
    t.datetime "date_debut"
    t.datetime "date_fin"
    t.decimal "cout"
    t.string "statut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_boosts_on_user_id"
  end

  create_table "calls", force: :cascade do |t|
    t.bigint "conversation_id", null: false
    t.string "call_type"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user1_id"
    t.integer "user2_id"
    t.index ["conversation_id"], name: "index_calls_on_conversation_id"
  end

  create_table "categorie_produits", force: :cascade do |t|
    t.string "titre"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compte_infos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "confirmation_code"
    t.datetime "confirmed_at"
    t.string "rccm", default: ""
    t.string "langue", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_compte_infos_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "user1_id"
    t.integer "user2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coordonnes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ville"
    t.string "pays"
    t.string "lat_lon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_coordonnes_on_user_id"
  end

  create_table "emplois", force: :cascade do |t|
    t.bigint "produit_id", null: false
    t.integer "type_contrat"
    t.string "lieu"
    t.string "secteur_activite"
    t.string "niveau_experience"
    t.date "date_limite"
    t.text "site_web"
    t.text "formation_requise"
    t.integer "etat_offre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produit_id"], name: "index_emplois_on_produit_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "evaluationable_type"
    t.integer "evaluationable_id"
    t.bigint "user_id", null: false
    t.integer "evaluation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "evenements", force: :cascade do |t|
    t.bigint "produit_id", null: false
    t.date "date_evenement"
    t.string "lieu"
    t.integer "type_prix"
    t.text "site_web"
    t.integer "etat_evenement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produit_id"], name: "index_evenements_on_produit_id"
  end

  create_table "favorie_produits", force: :cascade do |t|
    t.bigint "produit_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produit_id"], name: "index_favorie_produits_on_produit_id"
    t.index ["user_id"], name: "index_favorie_produits_on_user_id"
  end

  create_table "followers", force: :cascade do |t|
    t.bigint "vitrine_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_followers_on_user_id"
    t.index ["vitrine_id"], name: "index_followers_on_vitrine_id"
  end

  create_table "hotellerie_services", force: :cascade do |t|
    t.string "nom_hotel"
    t.text "type_hebergement"
    t.text "adresse"
    t.text "contacts"
    t.text "email"
    t.text "site_web", null: false
    t.integer "nombre_chambres"
    t.integer "capacite_accueil"
    t.decimal "tarif_moyen", null: false
    t.integer "devise", null: false
    t.text "horaires"
    t.string "localisation"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hotellerie_services_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "imageable_type"
    t.integer "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "immobiliers", force: :cascade do |t|
    t.bigint "produit_id", null: false
    t.integer "type_de_bien"
    t.string "adresse"
    t.string "surface_habitable"
    t.integer "nombre_chambres"
    t.integer "nombre_pieces"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produit_id"], name: "index_immobiliers_on_produit_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "conversation_id", null: false
    t.text "body"
    t.string "audio_file"
    t.boolean "is_read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "titre"
    t.string "type"
    t.text "message"
    t.boolean "is_read"
    t.datetime "date_expiration"
    t.integer "priorite"
    t.string "notificationable_type"
    t.integer "notificationable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "paiements", force: :cascade do |t|
    t.string "paiementable_type"
    t.integer "paiementable_id"
    t.string "mode"
    t.decimal "montant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produits", force: :cascade do |t|
    t.string "titre"
    t.decimal "prix"
    t.text "description"
    t.integer "devise"
    t.boolean "is_visible", default: true
    t.string "localisation"
    t.bigint "sub_categorie_produit_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_categorie_produit_id"], name: "index_produits_on_sub_categorie_produit_id"
    t.index ["user_id"], name: "index_produits_on_user_id"
  end

  create_table "projets", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.string "titre"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_projets_on_service_id"
  end

  create_table "recherche_produits", force: :cascade do |t|
    t.string "libele"
    t.bigint "user_id", null: false
    t.datetime "date_heure"
    t.integer "resultats"
    t.string "localisation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recherche_produits_on_user_id"
  end

  create_table "recommandations", force: :cascade do |t|
    t.string "recommandable_type"
    t.integer "recommandable_id"
    t.text "contenu"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recommandations_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "reservationable_type"
    t.integer "reservationable_id"
    t.bigint "user_id", null: false
    t.datetime "date_reservation"
    t.string "statut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "produit_id", null: false
    t.string "statut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produit_id"], name: "index_services_on_produit_id"
  end

  create_table "services_disponible_hotels", force: :cascade do |t|
    t.bigint "hotellerie_service_id", null: false
    t.string "nom_service"
    t.text "description"
    t.integer "statut"
    t.decimal "cout"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotellerie_service_id"], name: "index_services_disponible_hotels_on_hotellerie_service_id"
  end

  create_table "sub_categorie_produits", force: :cascade do |t|
    t.bigint "categorie_produit_id", null: false
    t.string "titre"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categorie_produit_id"], name: "index_sub_categorie_produits_on_categorie_produit_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "produit_id", null: false
    t.integer "notes", default: 0
    t.string "status", default: "en cours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["produit_id"], name: "index_transactions_on_produit_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "email@gmail.com"
    t.string "phone_number", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "role", default: "utilisateur"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicules", force: :cascade do |t|
    t.bigint "produit_id", null: false
    t.string "modele"
    t.integer "annee"
    t.string "kilometrage"
    t.integer "type_vehicule"
    t.string "couleur"
    t.string "carburant"
    t.string "transmission"
    t.integer "nombre_portes"
    t.integer "nombre_places"
    t.integer "statut"
    t.integer "plan_de_paiement"
    t.integer "disponibilite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produit_id"], name: "index_vehicules_on_produit_id"
  end

  create_table "vetement_chaussures", force: :cascade do |t|
    t.bigint "produit_id", null: false
    t.integer "type_vetement"
    t.integer "taille"
    t.integer "matiere"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produit_id"], name: "index_vetement_chaussures_on_produit_id"
  end

  create_table "vitrines", force: :cascade do |t|
    t.string "titre"
    t.text "description"
    t.string "profil_img"
    t.string "cover_img"
    t.text "specialites"
    t.text "horaires"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vitrines_on_user_id"
  end

  add_foreign_key "a_la_unes", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "autre_produit_attributs", "produits"
  add_foreign_key "boosts", "users"
  add_foreign_key "calls", "conversations"
  add_foreign_key "compte_infos", "users"
  add_foreign_key "coordonnes", "users"
  add_foreign_key "emplois", "produits"
  add_foreign_key "evaluations", "users"
  add_foreign_key "evenements", "produits"
  add_foreign_key "favorie_produits", "produits"
  add_foreign_key "favorie_produits", "users"
  add_foreign_key "followers", "users"
  add_foreign_key "followers", "vitrines"
  add_foreign_key "hotellerie_services", "users"
  add_foreign_key "immobiliers", "produits"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "produits", "sub_categorie_produits"
  add_foreign_key "produits", "users"
  add_foreign_key "projets", "services"
  add_foreign_key "recherche_produits", "users"
  add_foreign_key "recommandations", "users"
  add_foreign_key "reservations", "users"
  add_foreign_key "services", "produits"
  add_foreign_key "services_disponible_hotels", "hotellerie_services"
  add_foreign_key "sub_categorie_produits", "categorie_produits"
  add_foreign_key "transactions", "produits"
  add_foreign_key "transactions", "users"
  add_foreign_key "vehicules", "produits"
  add_foreign_key "vetement_chaussures", "produits"
  add_foreign_key "vitrines", "users"
end
