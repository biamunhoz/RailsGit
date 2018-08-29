# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180828184428) do

  create_table "dosimetros", force: :cascade do |t|
    t.string   "nome",           limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "monitoracao_id", limit: 4
  end

  create_table "monitoracaos", force: :cascade do |t|
    t.string   "siglalab",                  limit: 255
    t.string   "nome",                      limit: 255
    t.date     "datanasc"
    t.string   "sexo",                      limit: 255
    t.string   "cpf",                       limit: 255
    t.string   "iniciomes",                 limit: 255
    t.string   "inicioano",                 limit: 255
    t.integer  "tipomonitor",               limit: 4
    t.string   "departamento",              limit: 255
    t.string   "coddept",                   limit: 255
    t.string   "docente",                   limit: 255
    t.string   "emaildocente",              limit: 255
    t.string   "nomeinstituicao",           limit: 255
    t.string   "areaaplicacao",             limit: 255
    t.string   "tiporadiacao",              limit: 255
    t.string   "funcao",                    limit: 255
    t.string   "codfuncao",                 limit: 255
    t.string   "aplicacaoradiacao",         limit: 255
    t.text     "descricaouso",              limit: 65535
    t.string   "local",                     limit: 255
    t.string   "email",                     limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "documentocpf_file_name",    limit: 255
    t.string   "documentocpf_content_type", limit: 255
    t.integer  "documentocpf_file_size",    limit: 4
    t.datetime "documentocpf_updated_at"
    t.string   "numcnen",                   limit: 255
    t.integer  "dosimetro_id",              limit: 4
    t.integer  "status_id",                 limit: 4
    t.integer  "usuario_id",                limit: 4
    t.string   "estado",                    limit: 255
    t.string   "laboratorio",               limit: 255
    t.string   "outrafunc",                 limit: 255
    t.boolean  "possuidosimetro"
    t.string   "coddostemp",                limit: 255
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "descricao",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome",                limit: 255
    t.string   "email",               limit: 255
    t.boolean  "admin"
    t.string   "password_digest",     limit: 255
    t.string   "aut_token",           limit: 255
    t.string   "senha_reset_token",   limit: 255
    t.string   "senha_reset_sent_at", limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "cpf",                 limit: 255
    t.string   "telfixo",             limit: 255
    t.string   "telcelular",          limit: 255
    t.string   "ddfixo",              limit: 255
    t.string   "ddcel",               limit: 255
  end

end
