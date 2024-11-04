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

ActiveRecord::Schema[7.0].define(version: 2024_11_01_091146) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calls", force: :cascade do |t|
    t.bigint "conversation_id", null: false
    t.integer "caller"
    t.integer "receiver"
    t.string "call_type"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_calls_on_conversation_id"
  end

  create_table "categorie_produits", force: :cascade do |t|
    t.string "titre"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compte_infos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "confirmation_code"
    t.datetime "confirmed_at"
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
    t.integer "niveau_experience"
    t.date "date_limite"
    t.decimal "salaire"
    t.text "site_web"
    t.text "formation_requise"
    t.integer "etat_offre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produit_id"], name: "index_emplois_on_produit_id"
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
    t.integer "follower"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vitrine_id"], name: "index_followers_on_vitrine_id"
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
    t.integer "sender"
    t.text "body"
    t.string "audio_file"
    t.boolean "is_read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "notes_vitrines", force: :cascade do |t|
    t.bigint "vitrine_id", null: false
    t.integer "client"
    t.integer "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vitrine_id"], name: "index_notes_vitrines_on_vitrine_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "type"
    t.text "message"
    t.boolean "is_read"
    t.bigint "produit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produit_id"], name: "index_notifications_on_produit_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "paiements", force: :cascade do |t|
    t.bigint "transaction_id", null: false
    t.string "mode"
    t.decimal "montant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_id"], name: "index_paiements_on_transaction_id"
  end

  create_table "produits", force: :cascade do |t|
    t.string "titre"
    t.decimal "prix"
    t.text "description"
    t.integer "devise"
    t.boolean "is_visible", default: true
    t.bigint "sub_categorie_produit_id", null: false
    t.bigint "user_id", null: false
    t.text "images", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_categorie_produit_id"], name: "index_produits_on_sub_categorie_produit_id"
    t.index ["user_id"], name: "index_produits_on_user_id"
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
    t.integer "acheteur"
    t.integer "notes"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produit_id"], name: "index_transactions_on_produit_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: ""
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
    t.string "type_account"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicules", force: :cascade do |t|
    t.bigint "produit_id", null: false
    t.string "modele"
    t.integer "annee"
    t.string "kilometrage"
    t.integer "type_vehicule"
    t.string "couleur"
    t.integer "carburant"
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
    t.integer "type"
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

  add_foreign_key "calls", "conversations"
  add_foreign_key "compte_infos", "users"
  add_foreign_key "coordonnes", "users"
  add_foreign_key "emplois", "produits"
  add_foreign_key "evenements", "produits"
  add_foreign_key "favorie_produits", "produits"
  add_foreign_key "favorie_produits", "users"
  add_foreign_key "followers", "vitrines"
  add_foreign_key "immobiliers", "produits"
  add_foreign_key "messages", "conversations"
  add_foreign_key "notes_vitrines", "vitrines"
  add_foreign_key "notifications", "produits"
  add_foreign_key "notifications", "users"
  add_foreign_key "paiements", "transactions"
  add_foreign_key "produits", "sub_categorie_produits"
  add_foreign_key "produits", "users"
  add_foreign_key "sub_categorie_produits", "categorie_produits"
  add_foreign_key "transactions", "produits"
  add_foreign_key "vehicules", "produits"
  add_foreign_key "vetement_chaussures", "produits"
  add_foreign_key "vitrines", "users"
end
