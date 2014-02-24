# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


categories = Category.create(
		[
			{ name: "Beef", description: "Beef is the culinary name for meat from bovines, especially cattle. Beef can be harvested from cows, bulls, heifers or steers." },
			{ name: "Chicken", description: "Poultry; Meat from domesticated fowl" },
			{ name: "Lamb", description: "The meat of a sheep in its first year." },
			{ name: "Mutton", description: "The meat of an adult sheep." },
			{ name: "Veal", description: "The meat of young cattle." },
			{ name: "Burgers", description: "A round patty of ground meat." },
			{ name: "Sausages", description: "Spiced ground meat in a natural casing." },
			{ name: "Marinated Meats", description: "Meat covered in s seasoned liquid." }
		]
	)