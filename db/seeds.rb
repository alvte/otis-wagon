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
  content: "Embark on an intimate journey beyond traditional boundaries with anal exploration. This often-taboo realm invites you to discover uncharted territories of pleasure and connection. Despite common misconceptions, anal play can be a delightful and intimate experience when approached with care, open communication, and, naturally, a generous application of high-quality lubricant.

  Now, let's delve into the details. The anus is rich in nerve endings, and when stimulated, it can lead to powerful sensations and orgasmic bliss. However, (pun intended) communication is paramount. Discuss desires, establish boundaries, and proceed at a comfortable pace for both partners.

  For a smart yet cheeky insight: Anal intimacy is like jazz – it's about improvisation, rhythm, and a willingness to explore new sensations. Remember, consent and communication are your instruments in this symphony of pleasure. So, tune in, sync up, and enjoy the crescendo!",
  additional_resources: "https://en.wikipedia.org/wiki/Anal_sex"
)

card_anal_sex.categories = [cat_sexual_relations]

anal_sex_urls = ["https://res.cloudinary.com/dwhqsnhr5/image/upload/v1701768905/penetration_fu7rel.png"]
anal_sex_urls.each do |url|
  file = URI.open(url)
  card_anal_sex.photos.attach(io: file, filename: "anal_sex.png", content_type: 'image/png')
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

blowjob_urls = ["https://res.cloudinary.com/dwhqsnhr5/image/upload/v1701768717/blowjob_o9andp.png"]
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

masturbation_urls = ["https://res.cloudinary.com/dwhqsnhr5/image/upload/v1701768904/masturbation_ktafx1.png"]
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

clitoris_urls = ["https://res.cloudinary.com/dwhqsnhr5/image/upload/v1701768719/clitoris_evsh7x.png"]
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

endometriosis_urls = ["https://res.cloudinary.com/dwhqsnhr5/image/upload/v1701768906/vaginisme_zhqcf9.png"]
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

free_couple_urls = ["https://res.cloudinary.com/dwhqsnhr5/image/upload/v1701768728/free_couple_lyf6au.png"]
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

vaginismus_urls = ["https://res.cloudinary.com/dwhqsnhr5/image/upload/v1701768906/vaginisme_zhqcf9.png"]
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

jouissance_club_url = ["https://res.cloudinary.com/dwhqsnhr5/image/upload/v1701768921/jouissance_club_n5nlen.jpg"]
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

hot_drink_url = ["https://res.cloudinary.com/dwhqsnhr5/image/upload/v1701768921/rabbit-triple-stimulation-oki_huezet.jpg"]
hot_drink_url.each do |url|
  file = URI.open(url)
  hot_drink_boy.photos.attach(io: file, filename: "jouissance_club_book.png", content_type: 'image/jpg')
  hot_drink_boy.save
end

whisper_glide = Product.new(
  name: "Whisper Glide",
  price: 9,
  description: "Envisioned by an eccentric inventor who believed in the harmony of sensation and discretion, the WhisperGlide emerged as a delicate yet powerful aid for enhancing oral pleasure. This exquisite device boasted a soft, feather-like texture coupled with a gentle yet whisper-quiet vibration. Its ergonomic design, resembling a slender wand adorned with shimmering accents, allowed for effortless gliding and teasing motions. The WhisperGlide promised an enchanting symphony of sensations, evoking tantalizing shivers and delightful sighs with every caress."
)

succulent_swirl = Product.new(
  name: "Succulent Swirl",
  price: 22,
  description: "Crafted by an artisan inspired by the graceful dance of nature, the SucculentSwirl was a marvel of ingenuity. This marvelously intricate toy resembled a blooming flower, with soft, silicone petals delicately curved to mimic the tender touch of lips and tongue. Its innovative technology allowed for a mesmerizing, swirling motion, akin to an entrancing dance, designed to captivate and enthrall. The SucculentSwirl promised an enchanting experience, offering a symphony of sensations that ranged from delicate teasing to intense rapture, all controlled by the user's whim.",
)

bliss_bloom = Product.new(
  name: "Bliss Bloom",
  price: 25,
  description: "Born from the dreams of a visionary designer who believed in the fusion of art and pleasure, the BlissBloom emerged as a masterpiece of elegance and functionality. This wondrous creation resembled a blossoming flower, its petals composed of the softest, silkiest materials, designed to mimic the tender caress of loving lips. The BlissBloom was equipped with adjustable settings, allowing users to customize their experience—whether seeking a gentle, teasing embrace or an exhilarating surge of ecstasy. Its sophisticated design and intuitive controls promised an exquisite journey through the realms of passion and intimacy.
  Each of these enchanted creations was imbued with the intention of honoring and enhancing the timeless art of pleasure, inviting individuals into a realm of sensual exploration and boundless delight. Their names whispered promises of indulgence, their forms evoked desire, and their functions embraced the art of elevation in the realm of oral pleasure."
)

pleasure_pulse = Product.new(
  name: "Pleasure Pulse",
  price: 17,
  description: "Conceived by a visionary inventor driven by the pursuit of heightened pleasure, the PleasurePulse emerged as a testament to innovation in self-indulgence. This sleek, ergonomic device boasted a harmonious blend of gentle pulsations and customizable rhythms. Its design, reminiscent of a sculpted gemstone with smooth contours, held within it a mesmerizing array of sensations. The PleasurePulse promised a symphony of stimulations, from tender caresses to exhilarating pulses, all catered to the desires of its user."
)

sensation_sphere = Product.new(
  name: "Sensatio Sphere",
  price: 15,
  description:"Born from the imagination of an artist who believed in the union of aesthetics and sensuality, the SensatioSphere was a work of artistry. This ingenious creation resembled a polished sphere, its surface adorned with intricately designed patterns that teased the fingertips. Beneath its elegant facade lay a multitude of textures, each crafted to provide a unique sensation—gentle ripples, teasing ridges, and velvety contours. The SensatioSphere invited exploration, promising a journey of discovery and pleasure unlike any other."
)

eclipse_elation = Product.new(
  name: "Eclipse Elation",
  price: 8,
  description: "Conceived by a maverick engineer fascinated by celestial wonders, the EclipseElation was a masterpiece of technological prowess and pleasure. Resembling a cosmic orb with an otherworldly glow, this device boasted a sophisticated combination of vibration patterns and intensity levels. Its allure lay in the ability to simulate the ebb and flow of cosmic energies, offering a mesmerizing crescendo of sensations that ranged from subtle vibrations to pulsating waves. The EclipseElation promised an interstellar odyssey of self-discovery and blissful satisfaction."
)
glide_gazer = Product.new(
  name: "Glide Gazer",
  price: 10,
  description: "Conceived by an inventive mind dedicated to the pursuit of comfort and pleasure, the GlideGazer emerged as a testament to ergonomic design and indulgence. This sleek, curved device resembled a celestial arc, its surface adorned with a velvety-smooth texture. Crafted with premium silicone, it boasted a dual functionality—serving as both a gentle massager and a meticulously designed aid for enhanced anal intimacy. The GlideGazer promised effortless insertion and delightful sensations, offering a harmonious blend of comfort and stimulation."
)

pleasure_plume = Product.new(
  name: "Pleasure Plume",
  price: 12,
  description: "Inspired by the elegance of nature's delicate balance, the PleasurePlume was a marvel of versatility and sophistication. This uniquely designed toy resembled a feather, with a pliable yet resilient structure crafted for exquisite pleasure. Its tapered form and feather-like texture allowed for gradual exploration and heightened sensations. The PleasurePlume, with its gentle curves and gradual widening, promised a gradual journey into ecstasy, catering to the desires of explorative souls seeking comfort and fulfillment."
)

eclipse_embrace = Product.new(
  name: "Eclipse Embrace",
  price: 15,
  description: "Conceived by an innovative designer fascinated by celestial phenomena, the EclipseEmbrace stood as a testament to the fusion of technology and indulgence. Resembling a cosmic ring with a subtle, shimmering glow, this device was designed for both aesthetics and pleasure. Equipped with adjustable settings and a sleek, tapered form, the EclipseEmbrace offered a range of experiences—gentle vibrations to entrancing pulsations—ushering users into an exquisite realm of anal exploration. Its seamless design promised comfort, while its stimulating functions invited a celestial dance of intimacy and satisfaction."
)
