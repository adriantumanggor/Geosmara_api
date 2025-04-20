# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Reset semua data
Content.delete_all
CourseModule.delete_all
Course.delete_all

course = Course.create!(
  title: "Ketika Manusia Mulai Merekam Ruang"
)

modules = [
  {
    title: "Navigasi Alamiah",
    contents: [
      "Manusia prasejarah mengandalkan lingkungan mereka untuk bertahan hidup. Tanpa sistem navigasi modern, mereka harus memahami cara membaca tanda-tanda alamiah seperti arah matahari, posisi bintang, serta bentuk medan sekitar. Pengembaraan dan migrasi awal manusia didasarkan pada pemahaman intuitif terhadap ruang yang diwariskan secara turun-temurun melalui tradisi lisan.",
      "Selain navigasi alamiah, manusia prasejarah juga menggunakan goa sebagai tempat perlindungan dan komunikasi. Dinding gua menjadi medium pertama untuk merekam ruang dan pengalaman mereka. Lukisan-lukisan yang ditemukan di berbagai gua di dunia, seperti di Lascaux, Prancis, menunjukkan bahwa manusia telah berusaha mengabadikan ruang dalam bentuk visual sejak ribuan tahun yang lalu."
    ]
  },
  {
    title: "Kartografi Prasejarah",
    contents: [
      "Sebelum manusia mengenal kertas atau papirus, mereka sudah berusaha merekam dan memahami lingkungan sekitar dengan cara menggambar di dinding gua, mengukir batu, atau membuat simbol pada tanah liat. Ini merupakan bentuk paling awal dari kartografi, yang tidak hanya berfungsi sebagai alat navigasi, tetapi juga sebagai ekspresi budaya, ritual, dan pemahaman manusia terhadap dunia."
    ]
  },
  {
    title: "Motivasi di Balik Pemetaan",
    contents: [
      "Mengapa manusia mulai mencatat ruang? Selain untuk kebutuhan navigasi dan eksplorasi, rekaman ruang juga memiliki dimensi sosial dan politik. Peta digunakan untuk menandai kepemilikan wilayah, merencanakan strategi perang, serta memfasilitasi perdagangan. Dengan memahami alasan-alasan ini, kita dapat melihat bahwa pemetaan bukan sekadar alat bantu, tetapi juga simbol kekuasaan dan peradaban."
    ]
  }
]

modules.each_with_index do |mod, index|
  course_module = course.course_modules.create!(
    title: mod[:title],
    position: index + 1
  )

  mod[:contents].each_with_index do |text, i|
    course_module.contents.create!(
      text: text,
      position: i + 1
    )
  end
end

puts "✅ Seed data berhasil dibuat!"