# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

CardCategory.destroy_all
ProductCategory.destroy_all
Card.destroy_all
Product.destroy_all
Category.destroy_all
Message.destroy_all
Chatroom.destroy_all
Professional.destroy_all
User.destroy_all

User.create!(
  email: "admin@otis.com",
  password: "otisapp",
  nickname: "Admin",
  admin: true
)

User.create!(
  email: "didier@gmail.com",
  password: "jeneconnaisrienausex",
  nickname: "Didier",
  admin: false
)

User.create!(
  email: "pro@sex.com",
  password: "pro123",
  nickname: "Baptiste",
  admin: false
)

Professional.create!(
  name: "Baptiste",
  user_id: User.find_by(email: "pro@sex.com").id
)

User.create!(
  email: "gpt@gmail.com",
  password: "gpt123",
  nickname: "OtisBot",
  admin: false
)

Professional.create(
  name: "OtisBot",
  user_id: User.find_by(email: "gpt@gmail.com").id
)

cat_sexual_relations = Category.create!(
  name: "Sexual relations"
)

cat_self_pleasure = Category.create!(
  name: "Self pleasure"
)

cat_couple_life = Category.create!(
  name: "Couple life"
)

cat_disease = Category.create!(
  name: "Disease"
)

# Anal Sex
card_anal_sex = Card.new(
  title: "Anal Sex",
  summary: "Exploring Intimacy Beyond Boundaries",
  content: "!
  Embark on an intimate journey beyond traditional boundaries with anal exploration. This often-taboo realm invites you to discover uncharted territories of pleasure and connection. Despite common misconceptions, anal play can be a delightful and intimate experience when approached with care, open communication, and, naturally, a generous application of high-quality lubricant.

  Now, let's delve into the details. The anus is rich in nerve endings, and when stimulated, it can lead to powerful sensations and orgasmic bliss. However, (pun intended) communication is paramount. Discuss desires, establish boundaries, and proceed at a comfortable pace for both partners.

  For a smart yet cheeky insight: Anal intimacy is like jazz – it's about improvisation, rhythm, and a willingness to explore new sensations. Remember, consent and communication are your instruments in this symphony of pleasure. So, tune in, sync up, and enjoy the crescendo!",
  additional_resources: "https://en.wikipedia.org/wiki/Anal_sex"
)

card_anal_sex.categories = [cat_sexual_relations]

anal_sex_urls = ["https://res.cloudinary.com/dcvyn1qtm/image/upload/v1700833086/dreams_r_us/xxejtshwmrsmxolltxof.webp"]
anal_sex_urls.each do |url|
  file = URI.open(url)
  card_anal_sex.photos.attach(io: file, filename: "anal_sex.png", content_type: 'image/jpg')
  card_anal_sex.save
end

# Blowjob
card_blowjob = Card.new(
  title: "Blowjob Basics",
  summary: "Navigating the Art of Oral Pleasure",
  content: "Welcome to the enticing realm of Blowjob Basics, where the art of giving and receiving converges in a delightful dance of pleasure. Fellatio, the formal term for oral sex on a male, unfolds as an incredibly intimate and satisfying experience when approached with enthusiasm, communication, and a touch of creativity.

  Within this guide, we'll unravel the secrets of a mind-blowing blowjob, exploring techniques, communication strategies, and the significance of being attuned to your partner's reactions. Remember, it's not solely about the physical act; it's about forging a connection and sharing pleasure.

  Now, for the smart yet playful nugget of wisdom: Bestowing a fantastic blowjob is akin to crafting a gourmet meal. It demands skill, attention to detail, and a sincere desire to satisfy. So, regard this guide as your culinary school for the art of oral pleasure!",
  additional_resources: "https://en.wikipedia.org/wiki/Fellatio"
)

card_blowjob.categories = [cat_sexual_relations]

blowjob_urls = ["https://res.cloudinary.com/dcvyn1qtm/image/upload/v1700833086/dreams_r_us/z5gdk1jev6cs7ggfadfz.jpg"]
blowjob_urls.each do |url|
  file = URI.open(url)
  card_blowjob.photos.attach(io: file, filename: "blowjob.png", content_type: 'image/jpg')
  card_blowjob.save
end

# Masturbation
card_masturbation = Card.new(
  title: "Masturbation Magic",
  summary: "Embracing Self-Love and Discovery",
  content: "Prepare to embark on a journey of self-discovery, pleasure, and liberation with Masturbation Magic. Masturbation is not just a physical release; it's a celebration of self-love and a vital aspect of sexual well-being. It's about understanding your own body, desires, and what brings you pleasure.

  In this all-encompassing guide, we'll explore the perks of flying solo, discuss various techniques, and highlight the importance of embracing your own sexuality. Masturbation is like a secret garden – your own private oasis of pleasure waiting to be explored.

  Now, for the smart yet lighthearted observation: Masturbation is the ultimate form of self-love. It's like giving yourself a high-five and a hug simultaneously. So, let's break down the barriers of stigma and shame and celebrate the magic of solo pleasure!",
  additional_resources: "https://en.wikipedia.org/wiki/Masturbation"
)

card_masturbation.categories = [cat_self_pleasure]

masturbation_urls = ["https://res.cloudinary.com/dcvyn1qtm/image/upload/v1700833086/dreams_r_us/z5gdk1jev6cs7ggfadfz.jpg"]
masturbation_urls.each do |url|
  file = URI.open(url)
  card_masturbation.photos.attach(io: file, filename: "masturbation.png", content_type: 'image/jpg')
  card_masturbation.save
end

# Clitoris
card_clitoris = Card.new(
  title: "The Clitoris Unveiled",
  summary: "Understanding the Epicenter of Female Pleasure",
  content: "Get ready to meet the unsung hero of female pleasure – the clitoris! This small but mighty organ is a powerhouse of pleasure and a key player in the symphony of sexual satisfaction. In this guide, we'll dive into the anatomy, functions, and the art of giving this often underestimated pleasure point the attention it deserves.

Contrary to popular belief, the clitoris is not just a button; it's an entire complex structure designed for pleasure. Understanding the clitoris is like having a treasure map to unlock a world of delights.

Now, for the smart yet playful analogy: The clitoris is the maestro of the orchestra, conducting the sensations and orchestrating pleasure. So, let's give a standing ovation to this unsung hero!",
  additional_resources: "https://en.wikipedia.org/wiki/Clitoris"
)

card_clitoris.categories = [cat_couple_life]

clitoris_urls = ["https://res.cloudinary.com/dcvyn1qtm/image/upload/v1700833086/dreams_r_us/z5gdk1jev6cs7ggfadfz.jpg"]
clitoris_urls.each do |url|
  file = URI.open(url)
  card_clitoris.photos.attach(io: file, filename: "clitoris.png", content_type: 'image/jpg')
  card_clitoris.save
end

# Endometriosis
card_endometriosis = Card.new(
  title: "Endometriosis Demystified",
  summary: "Navigating the Challenges of a Common Health Issue",
  content: "Embark on a journey of understanding and support with 'Endometriosis Demystified.' This common yet often misunderstood condition can be a significant roadblock on the path of sexual wellness. In this comprehensive guide, we'll unravel the mysteries of endometriosis, discuss its impact on intimacy, and explore strategies for managing the challenges it presents.

Endometriosis is like an uninvited guest – it requires understanding, empathy, and effective coping strategies. The key is open communication
and a collaborative approach to navigate the challenges it poses to both physical and emotional well-being.

Now, for a smart yet empathetic perspective: Endometriosis is like a skilled chess opponent; it requires strategic moves, patience, and a supportive team to face its challenges. So, let's lace up our metaphorical chess boots and face this opponent together, armed with knowledge and resilience.",
  additional_resources: "https://en.wikipedia.org/wiki/Endometriosis"
)

card_endometriosis.categories = [cat_disease]

endometriosis_urls = ["https://res.cloudinary.com/dcvyn1qtm/image/upload/v1700833086/dreams_r_us/z5gdk1jev6cs7ggfadfz.jpg"]
endometriosis_urls.each do |url|
  file = URI.open(url)
  card_endometriosis.photos.attach(io: file, filename: "endometriosis.png", content_type: 'image/jpg')
  card_endometriosis.save
end

# Free Couple
card_free_couple = Card.new(
  title: "Embracing Freedom in a Relationship",
  summary: "The Joy of an Open and Honest Connection",
  content: "Welcome to the world of the 'Free Couple' – a relationship built on trust, communication, and the freedom to express desires openly. In this guide, we'll delve into the advantages and challenges of an open relationship, providing insights into fostering a strong, honest connection with your partner. Discover how embracing openness can lead to a deeper understanding and appreciation for each other.

Consider this guide your passport to relationship freedom, where trust is the currency and communication is the key. It's about creating a relationship that suits the unique dynamics and desires of you and your partner.

Now, for the smart yet liberating insight: Being part of a free couple is like dancing without a script. It's about finding your rhythm, syncing up, and enjoying the dance of love on your terms.",
  additional_resources: "https://www.liberation.fr/vous/2010/05/27/l-amour-libre-une-facon-de-se-proteger-de-faire-moins-complique_654647/"
)

card_free_couple.categories = [cat_couple_life]

free_couple_urls = ["https://res.cloudinary.com/dcvyn1qtm/image/upload/v1700833086/dreams_r_us/z5gdk1jev6cs7ggfadfz.jpg"]
free_couple_urls.each do |url|
  file = URI.open(url)
  card_free_couple.photos.attach(io: file, filename: "free_couple.png", content_type: 'image/jpg')
  card_free_couple.save
end

# Vaginismus
card_vaginismus = Card.new(
  title: "Understanding Vaginismus",
  summary: "Breaking Down Barriers to Intimacy",
  content: "Vaginismus can be a challenging hurdle, but it's not the end of the road. 'Understanding Vaginismus' is your comprehensive guide to unraveling the layers, understanding the causes, and exploring ways to overcome the physical and emotional barriers to a fulfilling intimate life.

This guide is your ally in navigating the complexities of vaginismus with sensitivity and understanding. It's about fostering self-compassion, seeking support, and exploring strategies for a fulfilling intimate life.

Now, for the smart yet hopeful analogy: Overcoming vaginismus is like solving a puzzle. It requires patience, the right pieces, and the understanding that every puzzle is unique. Together, let's find the pieces that fit for you.",
  additional_resources: "https://en.wikipedia.org/wiki/Vaginismus"
)

card_vaginismus.categories = [cat_disease]

vaginismus_urls = ["https://res.cloudinary.com/dcvyn1qtm/image/upload/v1700833086/dreams_r_us/z5gdk1jev6cs7ggfadfz.jpg"]
vaginismus_urls.each do |url|
  file = URI.open(url)
  card_vaginismus.photos.attach(io: file, filename: "vaginismus.png", content_type: 'image/jpg')
  card_vaginismus.save
end

jouissance_club_book = Product.new(
  name: "Jouissance club - book",
  price: 17.90,
  description: "Feel like you're missing out on your sexuality?
  No need to panic, Jüne from the Instagram account Jouissance Club brings a breath of fresh air and hope by offering a sexual education manual promoting accessible pleasure for everyone: women, men, non-binary individuals, heterosexual, homosexual, bisexual, etc!
  With the help of numerous simple and elegant diagrams, she provides a map of the multiple pleasure zones and an inventory of orgasmic movements."
)

jouissance_club_book.categories = [cat_sexual_relations]

jouissance_club_url = ["https://res.cloudinary.com/dcvyn1qtm/image/upload/v1700833086/dreams_r_us/z5gdk1jev6cs7ggfadfz.jpg"]
jouissance_club_url.each do |url|
  file = URI.open(url)
  jouissance_club_book.photos.attach(io: file, filename: "jouissance_club_book.png", content_type: 'image/jpg')
  jouissance_club_book.save
end

rabbit_triple_toy = Product.new(
  name: "Rabbit triple stimulation Öki",
  price: 17.90,
  description: "With the Black Edition ÖKI rabbit, enter the 3rd dimension!

  Usually, a rabbit has 2 dimensions: a vaginal branch and a clitoral branch... already pretty good for reaching climax.

  ÖKI's big 'plus' is what happens at the end of the vaginal branch. A 'tapping' finger has been placed right at the end of its flat head to stimulate the G-spot even more effectively. It's a finesse even more expert than a human's touch, guaranteed to send you over the edge! No less than 3 very powerful motors activate simultaneously or separately in this toy. All nerve endings of the external and internal clitoris will be solicited. Enough to teleport you into the 4th dimension ;)"
)

rabbit_triple_toy.categories = [cat_self_pleasure]

hot_drink_boy = Product.new(
  name: "HOT DRINK bois bandé pour homme",
  price: 17.90,
  description: "This product is designed for men looking to enhance their sexual activity or who are experiencing periods of fatigue and low energy.

  The product acts as an aphrodisiac, thanks to its natural components:

  Muira Puama (Potency Wood) increases sexual desire.

  Ginseng boosts sexual vitality and leads to an improvement in erection.

  Guarana, containing caffeine, acts as a stimulating tonic."
)

hot_drink_boy.categories = [cat_self_pleasure]

hot_drink_url = ["https://res.cloudinary.com/dcvyn1qtm/image/upload/v1700833086/dreams_r_us/z5gdk1jev6cs7ggfadfz.jpg"]
hot_drink_url.each do |url|
  file = URI.open(url)
  hot_drink_boy.photos.attach(io: file, filename: "jouissance_club_book.png", content_type: 'image/jpg')
  hot_drink_boy.save
end
