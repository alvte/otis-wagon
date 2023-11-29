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

Professional.create(
  email: "gpt@gmail.com",
  password: "gpt123"
)

User.create!(
  email: "admin@otis.com",
  password: "otisapp",
  admin: true
)

User.create!(
  email: "didier@gmail.com",
  password: "jeneconnaisrienausex",
  admin: false
)

User.create!(
  email: "pro@sex.com",
  password: "pro123",
  admin: false
)

Professional.create!(
  name: "Baptiste",
  user_id: User.find_by(email: "pro@sex.com").id,
)

cat_sexual_practices = Category.create!(
  name: "Sexual practices"
)

cat_better_know_yourself = Category.create!(
  name: "Know yourself"
)

cat_relations = Category.create!(
  name: "Human relations"
)

cat_18_plus = Category.create!(
  name: "18+"
)

cat_kids_related = Category.create!(
  name: "Kids related"
)

# Anal Sex
card_anal_sex = Card.new(
  title: "Anal Sex",
  summary: "Exploring Intimacy Beyond Boundaries",
  content: "Embark on an intimate journey beyond the traditional boundaries with anal sex. This often-taboo topic invites you to explore uncharted territories of pleasure and connection. Contrary to popular belief, anal play can be a delightful and intimate experience when approached with care, open communication, and, of course, a generous application of good-quality lubricant.

So, let's talk about the nitty-gritty. The anus is full of nerve endings, and when stimulated, it can lead to powerful sensations and orgasmic bliss. But, and it's a big but (pun intended), communication is key. It's crucial to discuss desires, set boundaries, and proceed at a comfortable pace for both partners.

Now, for the smart yet cheeky insight: Anal sex is like jazz – it's all about improvisation, rhythm, and a willingness to explore new sensations. Just remember, consent and communication are your instruments in this symphony of pleasure. So, tune in, sync up, and enjoy the crescendo!

For a deeper dive into the world of anal pleasure, you can check out more information on the Wikipedia page about [Anal Sex](https://en.wikipedia.org/wiki/Anal_sex).",
  additional_resources: "https://en.wikipedia.org/wiki/Anal_sex"
)

card_anal_sex.categories = [cat_sexual_practices, cat_relations, cat_18_plus]

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
  content: "Welcome to the tantalizing world of Blowjob Basics – where giving and receiving meet in a dance of pleasure. Fellatio, the formal term for oral sex performed on a male, can be an incredibly intimate and satisfying experience when approached with enthusiasm, communication, and a dash of creativity.

In this guide, we'll uncover the secrets of a mind-blowing blowjob, discussing techniques, communication strategies, and the importance of being attuned to your partner's reactions. Remember, it's not just about the physical act; it's about building a connection and sharing pleasure.

Now, for the smart yet playful nugget of wisdom: Giving a great blowjob is like preparing a gourmet meal. It requires skill, attention to detail, and a genuine desire to satisfy. So, consider this guide your culinary school for the art of oral pleasure!

For those eager to delve deeper into the world of fellatio, you can find more insights on the Wikipedia page about [Fellatio](https://en.wikipedia.org/wiki/Fellatio).",
  additional_resources: "https://en.wikipedia.org/wiki/Fellatio"
)

card_blowjob.categories = [cat_sexual_practices, cat_18_plus]

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

In this comprehensive guide, we'll explore the perks of flying solo, discuss various techniques, and highlight the importance of embracing your own sexuality. Masturbation is like a secret garden – your own private oasis of pleasure waiting to be explored.

Now, for the smart yet lighthearted observation: Masturbation is the ultimate form of self-love. It's like giving yourself a high-five and a hug simultaneously. So, let's break down the barriers of stigma and shame and celebrate the magic of solo pleasure!

For those curious to delve deeper into the world of self-love, you can find more insights on the Wikipedia page about [Masturbation](https://en.wikipedia.org/wiki/Masturbation).",
  additional_resources: "https://en.wikipedia.org/wiki/Masturbation"
)

card_masturbation.categories = [cat_sexual_practices]

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

Now, for the smart yet playful analogy: The clitoris is the maestro of the orchestra, conducting the sensations and orchestrating pleasure. So, let's give a standing ovation to this unsung hero!

For those eager to explore more about the clitoris, you can find additional insights on the Wikipedia page about the [Clitoris](https://en.wikipedia.org/wiki/Clitoris).",
  additional_resources: "https://en.wikipedia.org/wiki/Clitoris"
)

card_clitoris.categories = [cat_better_know_yourself, cat_relations]

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

Now, for a smart yet empathetic perspective: Endometriosis is like a skilled chess opponent; it requires strategic moves, patience, and a supportive team to face its challenges. So, let's lace up our metaphorical chess boots and face this opponent together, armed with knowledge and resilience.

For those seeking a deeper dive into the complexities of endometriosis, you can explore more on the Wikipedia page about [Endometriosis](https://en.wikipedia.org/wiki/Endometriosis).",
  additional_resources: "https://en.wikipedia.org/wiki/Endometriosis"
)

card_endometriosis.categories = [cat_better_know_yourself]

endometriosis_urls = ["https://res.cloudinary.com/dcvyn1qtm/image/upload/v1700833086/dreams_r_us/z5gdk1jev6cs7ggfadfz.jpg"]
endometriosis_urls.each do |url|
  file = URI.open(url)
  card_endometriosis.photos.attach(io: file, filename: "endometriosis.png", content_type: 'image/jpg')
  card_endometriosis.save
end

# Talking to Child About Sex
card_talk_about_sex = Card.new(
  title: "Talking to Kids About Sex",
  summary: "Navigating Awkward Conversations with Ease",
  content: "Dread the 'birds and bees' talk? Fear not! 'Talking to Kids About Sex' is your comprehensive guide to navigating the delicate topic of sex education with your children. From age-appropriate discussions to answering those tricky questions, this guide is your ally in making these conversations less awkward and more educational for both you and your children.

Imagine this guide as your superhero cape in the world of parenting, equipped with superpowers to tackle any question that comes your way. It's not about having all the answers but fostering an open and healthy dialogue.

Now, for the smart yet comforting analogy: Talking to your kids about sex is like teaching them to ride a bike. It might feel wobbly at first, but with patience, support, and maybe a few scraped knees, they'll eventually find their balance.

For those eager to explore additional resources on sex education, you can find more information on the Wikipedia page about [Sex Education](https://en.wikipedia.org/wiki/Sex_education).",
  additional_resources: "https://www.nytimes.com/2020/07/14/parenting/talking-about-sex-with-kids.html"
)

card_talk_about_sex.categories = [cat_relations]

talk_about_sex_urls = ["https://res.cloudinary.com/dcvyn1qtm/image/upload/v1700833086/dreams_r_us/z5gdk1jev6cs7ggfadfz.jpg"]
talk_about_sex_urls.each do |url|
  file = URI.open(url)
  card_talk_about_sex.photos.attach(io: file, filename: "talk_about_sex.png", content_type: 'image/jpg')
  card_talk_about_sex.save
end

# Free Couple
card_free_couple = Card.new(
  title: "Embracing Freedom in a Relationship",
  summary: "The Joy of an Open and Honest Connection",
  content: "Welcome to the world of the 'Free Couple' – a relationship built on trust, communication, and the freedom to express desires openly. In this guide, we'll delve into the advantages and challenges of an open relationship, providing insights into fostering a strong, honest connection with your partner. Discover how embracing openness can lead to a deeper understanding and appreciation for each other.

Consider this guide your passport to relationship freedom, where trust is the currency and communication is the key. It's about creating a relationship that suits the unique dynamics and desires of you and your partner.

Now, for the smart yet liberating insight: Being part of a free couple is like dancing without a script. It's about finding your rhythm, syncing up, and enjoying the dance of love on your terms.

For those curious to explore more about open relationships, you can find additional insights on the Wikipedia page about [Open Relationships](https://en.wikipedia.org/wiki/Open_relationship).",
  additional_resources: "https://www.liberation.fr/vous/2010/05/27/l-amour-libre-une-facon-de-se-proteger-de-faire-moins-complique_654647/"
)

card_free_couple.categories = [cat_relations]

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

Now, for the smart yet hopeful analogy: Overcoming vaginismus is like solving a puzzle. It requires patience, the right pieces, and the understanding that every puzzle is unique. Together, let's find the pieces that fit for you.

For those eager to delve deeper into the world of vaginismus, you can find more insights on the Wikipedia page about [Vaginismus](https://en.wikipedia.org/wiki/Vaginismus).",
  additional_resources: "https://en.wikipedia.org/wiki/Vaginismus"
)

card_vaginismus.categories = [cat_better_know_yourself]

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

jouissance_club_book.categories = [cat_better_know_yourself]

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

rabbit_triple_toy.categories = [cat_sexual_practices]

hot_drink_boy = Product.new(
  name: "HOT DRINK bois bandé pour homme",
  price: 17.90,
  description: "With the Black Edition ÖKI rabbit, enter the 3rd dimension!

  Usually, a rabbit has 2 dimensions: a vaginal branch and a clitoral branch... already pretty good for reaching climax.

  ÖKI's big 'plus' is what happens at the end of the vaginal branch. A 'tapping' finger has been placed right at the end of its flat head to stimulate the G-spot even more effectively. It's a finesse even more expert than a human's touch, guaranteed to send you over the edge! No less than 3 very powerful motors activate simultaneously or separately in this toy. All nerve endings of the external and internal clitoris will be solicited. Enough to teleport you into the 4th dimension ;)"
)

hot_drink_boy.categories = [cat_18_plus, cat_sexual_practices]

hot_drink_url = ["https://res.cloudinary.com/dcvyn1qtm/image/upload/v1700833086/dreams_r_us/z5gdk1jev6cs7ggfadfz.jpg"]
hot_drink_url.each do |url|
  file = URI.open(url)
  hot_drink_boy.photos.attach(io: file, filename: "jouissance_club_book.png", content_type: 'image/jpg')
  hot_drink_boy.save
end
