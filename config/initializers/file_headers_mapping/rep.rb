REP_HEADER_MAPPING = {
  nom_greffe: nil,
  siren_entreprise: :siren,
  siren: :siren_pm,
  type: :type_representant,
  nom_patronymique: :nom_patronyme,
  rep_perm_nom: :representant_permanent_nom_patronyme,
  rep_perm_nom_usage: :representant_permanent_nom_usage,
  rep_perm_pseudo: :representant_permanent_pseudonyme,
  rep_perm_prenoms: :representant_permanent_prenoms,
  rep_perm_date_naissance: :representant_permanent_date_naissance,
  rep_perm_ville_naissance: :representant_permanent_ville_naissance,
  rep_perm_pays_naissance: :representant_permanent_pays_naissance,
  rep_perm_nationalite: :representant_permanent_nationalite,
  rep_perm_adr_ligne1: :representant_permanent_adresse_ligne_1,
  rep_perm_adr_ligne2: :representant_permanent_adresse_ligne_2,
  rep_perm_adr_ligne3: :representant_permanent_adresse_ligne_3,
  rep_perm_code_postal: :representant_permanent_adresse_code_postal,
  rep_perm_ville: :representant_permanent_adresse_ville,
  rep_perm_code_commune: :representant_permanent_adresse_code_commune,
  rep_perm_pays: :representant_permanent_adresse_pays,
  conjoint_collab_nom_patronym: :conjoint_collab_nom_patronyme,
  conjoint_collab_pseudo: :conjoint_collab_pseudonyme,
  adresse_ligne1: :adresse_ligne_1,
  adresse_ligne2: :adresse_ligne_2,
  adresse_ligne3: :adresse_ligne_3,
  code_postal: :adresse_code_postal,
  ville: :adresse_ville,
  code_commune: :adresse_code_commune,
  pays: :adresse_pays,
  date_greffe: :date_derniere_modification,
  libelle_evt: :libelle_derniere_modification,
}
