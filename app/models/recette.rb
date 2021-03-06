class Recette < ApplicationRecord
  #  Émie Doucet
  #  Web: Serveur 2
  #  Laboratoire 5
  #  30/11/2021
  # Relations
  belongs_to :user
  has_many :recette_ingredients
  has_many :ingredients, through: :recette_ingredients

  # Validations
  validates :titre, :etapes, presence: true
  # TP5 30/11/2021
  #validate :valide_min_ingredient # une recette doit avoir au moins deux ingrédients

  # Fonctionnalité privé au modèle
  private
  def valide_min_ingredient
    if self.recette_ingredients.size < 2
      errors.add(:recette_ingredients, "need at least 2 items in a recipe")
    end
  end

end
