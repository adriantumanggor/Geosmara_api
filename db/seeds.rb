# Reset semua data
Content.delete_all
CourseModule.delete_all
Course.delete_all

ActiveRecord::Base.connection.reset_pk_sequence!('courses')
ActiveRecord::Base.connection.reset_pk_sequence!('course_modules')
ActiveRecord::Base.connection.reset_pk_sequence!('contents')

def seed_course(title, image_url, modules)
  course = Course.create!(title: title, image_url: image_url)

  modules.each do |mod|
    course_module = course.course_modules.create!(
      title: mod[:title],
      image_urls: mod[:image_urls]
    )

    mod[:contents].each do |content_text|
      course_module.contents.create!(text: content_text)
    end
  end
end

# Course 1
seed_course("Ketika Manusia Mulai Merekam Ruang", "/ketika.png", [
  {
    title: "Navigasi Alamiah",
    image_urls: [
      "/navlam.jpg",
      "/navlam2.jpg"
    ],
    contents: [
      "Manusia prasejarah mengandalkan lingkungan mereka untuk bertahan hidup. Tanpa sistem navigasi modern, mereka harus memahami cara membaca tanda-tanda alamiah seperti arah matahari, posisi bintang, serta bentuk medan sekitar. Pengembaraan dan migrasi awal manusia didasarkan pada pemahaman intuitif terhadap ruang yang diwariskan secara turun-temurun melalui tradisi lisan.",
      "Selain navigasi alamiah, manusia prasejarah juga menggunakan goa sebagai tempat perlindungan dan komunikasi. Dinding gua menjadi medium pertama untuk merekam ruang dan pengalaman mereka. Lukisan-lukisan yang ditemukan di berbagai gua di dunia, seperti di Lascaux, Prancis, menunjukkan bahwa manusia telah berusaha mengabadikan ruang dalam bentuk visual sejak ribuan tahun yang lalu.",
      "Selain representasi visual, sistem pemetaan lisan juga berkembang di banyak kebudayaan awal. Suku-suku asli di berbagai belahan dunia memiliki metode unik untuk menyampaikan informasi spasial melalui cerita dan nyanyian yang menggambarkan jalur dan lokasi penting. Sistem ini memungkinkan mereka berbagi pengetahuan navigasi tanpa perlu bentuk peta fisik."
    ]
  },
  {
    title: "Kartografi Prasejarah",
    image_urls: [
      "/karto.jpg",
      "/karto2.jpeg"
    ],
    contents: [
      "Sebelum manusia mengenal kertas atau papirus, mereka sudah berusaha merekam dan memahami lingkungan sekitar dengan cara menggambar di dinding gua, mengukir batu, atau membuat simbol pada tanah liat. Ini merupakan bentuk paling awal dari kartografi, yang tidak hanya berfungsi sebagai alat navigasi, tetapi juga sebagai ekspresi budaya, ritual, dan pemahaman manusia terhadap dunia.",
      "Salah satu contoh paling terkenal dari peta prasejarah adalah lukisan di Gua Lascaux, Prancis (sekitar 17.000 tahun yang lalu). Lukisan ini menggambarkan wilayah berburu dan jalur migrasi hewan, yang kemungkinan besar digunakan oleh manusia purba untuk merencanakan perburuan. Beberapa teori juga menyebutkan bahwa peta ini tidak hanya bersifat praktis, tetapi memiliki nilai spiritual, seperti bagian dari ritual keberuntungan sebelum berburu.",
      "Seiring waktu, manusia mengembangkan teknik yang lebih canggih untuk merekam ruang dan geografis mereka. Salah satu contoh paling signifikan adalah tablet tanah liat Babilonia dari abad ke-6 SM, yang dianggap sebagai salah satu peta dunia tertua. Peta ini menggambarkan Babilonia di pusatnya, dengan wilayah sekitarnya seperti sungai Efrat dan kota-kota lainnya yang dikenal saat itu.",
      "Ketika manusia mulai hidup dalam komunitas yang lebih besar dan menetap, kebutuhan akan peta yang lebih kompleks semakin meningkat. Teknik pembuatan peta berkembang dari pengukiran batu dan tanah liat ke penggunaan papirus dan perkamen. Peradaban seperti Mesir, Yunani, dan Romawi kemudian mengembangkan peta yang lebih akurat dengan sistem koordinat dan skala.Dengan berkembangnya peta, manusia tidak hanya memahami dunia di sekitar mereka, tetapi juga mempengaruhi bagaimana mereka berinteraksi dengan lingkungan, menjelajah, berdagang, dan bahkan berperang. Kartografi prasejarah adalah fondasi bagi sistem pemetaan yang lebih maju, yang akhirnya berkembang menjadi ilmu geografi modern seperti yang kita kenal saat ini."
    ]
  },
  {
    title: "Motivasi di Balik Pemetaan",
    image_urls: ["/ketika.png"],
    contents: [
      "Mengapa manusia mulai mencatat ruang? Selain untuk kebutuhan navigasi dan eksplorasi, rekaman ruang juga memiliki dimensi sosial dan politik. Peta digunakan untuk menandai kepemilikan wilayah, merencanakan strategi perang, serta memfasilitasi perdagangan. Dengan memahami alasan-alasan ini, kita dapat melihat bahwa pemetaan bukan sekadar alat bantu, tetapi juga simbol kekuasaan dan peradaban.",
      "Seiring perkembangan masyarakat, pemetaan menjadi semakin penting dalam pengelolaan sumber daya dan perencanaan kota. Di Mesopotamia, peta digunakan untuk mengatur sistem irigasi, sementara di Romawi, peta menjadi alat vital dalam administrasi wilayah yang luas. Pemetaan tidak hanya membantu manusia memahami lingkungan mereka, tetapi juga memungkinkan mereka untuk mengontrol dan mengelola ruang dengan lebih efektif.",
      "Motivasi paling mendasar dalam pembuatan peta adalah kebutuhan untuk memahami dan menjelajahi lingkungan.",
      "Kelompok pemburu-pengumpul menggunakan representasi visual untuk menandai jalur migrasi hewan, sumber air, dan tempat perlindungan. Di kemudian hari, para pelaut seperti bangsa Fenisia, Yunani, dan Viking menggunakan peta laut untuk menjelajah wilayah baru, mencari jalur perdagangan, dan menghindari bahaya di laut.Pada Zaman Penjelajahan (abad ke-15-17), peta menjadi alat penting bagi navigator seperti Columbus dan Magellan dalam menaklukkan rute baru di dunia."
    ]
  }
])

# Course 2
seed_course("Kartografi Kuno dan Penjelajahan Dunia", "/kartokuno.png", [
  {
    title: "Kartografi dalam Peradaban Kuno",
    image_urls: ["/kartokuno.png"],
    contents: [
      "Mesir kuno menggunakan peta untuk mengelola wilayah pertanian di sepanjang Sungai Nil. Peta tanah digunakan untuk menentukan hak kepemilikan dan distribusi hasil panen. Selain itu, hieroglif Mesir juga menunjukkan sketsa tata kota dan jalur perdagangan yang memperlihatkan bagaimana masyarakat mereka memahami ruang.Di Yunani, pemikiran geografi berkembang dengan pesat. Anaximander, salah satu filsuf pertama yang tertarik pada pemetaan, menciptakan sketsa dunia yang dianggap sebagai salah satu peta pertama di dunia Barat. Kemudian, Ptolemy mengembangkan sistem koordinat yang memungkinkan pemetaan dunia secara lebih akurat, sebuah konsep yang menjadi dasar bagi kartografi modern.",
      "Bangsa Romawi, dengan imperium luasnya, mengandalkan peta untuk mengatur administrasi dan strategi militer. Mereka menciptakan peta jalan seperti Tabula Peutingeriana, yang menunjukkan jalur utama kekaisaran, membantu pergerakan pasukan, dan mengatur perdagangan antarwilayah.",
      "Tiongkok juga memainkan peran penting dalam sejarah kartografi. Para cendekiawan Tiongkok menciptakan peta yang sangat detail dan akurat, seperti peta yang dibuat oleh Pei Xiu pada abad ke-3 Masehi. Teknik pemetaan mereka mencerminkan pemahaman geografi yang mendalam dan kebutuhan administratif untuk mengelola wilayah luas."
    ]
  },
  {
    title: "Zaman Penjelajahan dan Revolusi Kartografi",
    image_urls: ["/kartokuno.png"],
    contents: [
      "Zaman Penjelajahan (Age of Exploration) dari abad ke-15 hingga ke-17 ditandai dengan ekspedisi-ekspedisi besar yang dilakukan oleh bangsa Eropa untuk mencari jalur perdagangan baru, sumber daya alam, dan wilayah baru untuk dikuasai. Kemajuan dalam kartografi (ilmu pembuatan peta) berperan penting dalam kesuksesan eksplorasi ini, sekaligus mengalami revolusi besar karena meningkatnya kebutuhan akan peta yang lebih akurat.",
      "Pada awalnya, peta yang digunakan oleh para navigator sering kali tidak akurat dan penuh spekulasi. Peta dunia abad pertengahan, seperti peta T-O dan mappa mundi, lebih banyak didasarkan pada pandangan teologis daripada observasi nyata. Namun, ketika ekspedisi mulai menjelajahi dunia secara langsung, para kartografer mulai mengumpulkan data yang lebih akurat dari laporan para navigator.Para pelaut seperti Christopher Columbus, Vasco da Gama, dan Ferdinand Magellan sangat bergantung pada peta untuk navigasi mereka. Seiring waktu, peta semakin diperbaiki berdasarkan catatan perjalanan dan pengamatan astronomi. Salah satu kemajuan besar adalah penggunaan garis lintang dan bujur untuk menentukan lokasi secara lebih presisi.",
      "Zaman Penjelajahan membawa revolusi besar dalam kartografi. Dari peta yang masih banyak ketidakakuratan, perkembangan seperti proyeksi Mercator menjadikan navigasi lebih efektif dan dunia semakin dapat dimengerti. Namun, kemajuan ini juga berdampak pada ekspansi kolonial yang mengubah sejarah geopolitik global. Peta bukan hanya alat eksplorasi, tetapi juga alat kekuasaan yang menentukan jalannya sejarah manusia."
    ]
  },
  {
    title: "Peta sebagai Alat Kekuasaan",
    image_urls: ["/kartokuno.png"],
    contents: [
      "Seiring berkembangnya eksplorasi dan kolonialisme, peta menjadi alat utama dalam perebutan kekuasaan. Negara-negara Eropa seperti Spanyol, Portugal, Inggris, dan Belanda menggunakan peta untuk menandai wilayah jajahan mereka, menetapkan batas-batas yang sering kali tidak mempertimbangkan masyarakat lokal.",
      "Peta juga digunakan sebagai alat propaganda. Banyak peta kolonial dibuat untuk menunjukkan keunggulan peradaban Barat dibandingkan dengan masyarakat pribumi. Wilayah-wilayah yang baru ditemukan sering kali digambarkan dengan cara yang menguntungkan bangsa penjajah, memberikan legitimasi terhadap klaim mereka.",
      "Di sisi lain, kartografi juga memainkan peran dalam strategi militer dan diplomasi. Peta digunakan dalam perundingan perbatasan, perencanaan perang, dan pengelolaan sumber daya. Dengan demikian, kartografi tidak hanya berfungsi sebagai alat ilmiah, tetapi juga sebagai instrumen politik dan ekonomi yang sangat berpengaruh.. Peradaban kuno seperti Mesir, Yunani, Romawi, dan Tiongkok mulai mengembangkan teknik pemetaan yang lebih canggih. Dari hieroglif yang menggambarkan tata kota Mesir kuno hingga peta berbasis grid Romawi, kita melihat bagaimana pemetaan mulai menjadi alat penting dalam administrasi dan geopolitik.",
    ]
  }
])

# Course 3
seed_course("Ilmu Pengetahuan di Balik Peta", "/ilmudibalikpeta.png", [
  {
    title: "Pemahaman Ruang Modern",
    image_urls: ["/ilmudibalikpeta.png"],
    contents: [
      "Dengan berkembangnya teknologi dan ilmu pengetahuan, pemahaman tentang ruang tidak lagi terbatas pada aspek fisik semata. Ruang kini dipahami sebagai entitas dinamis yang terus berubah seiring dengan aktivitas manusia dan fenomena alam. Pemodelan spasial modern memungkinkan analisis kompleks yang mencakup berbagai faktor seperti demografi, ekonomi, dan lingkungan.",
      "Para ilmuwan geografi telah mengembangkan berbagai metode untuk mengukur dan memetakan interaksi antara manusia dan lingkungan. Model spasial kini banyak digunakan dalam perencanaan kota, manajemen sumber daya alam, serta mitigasi bencana. Teknologi SIG (Sistem Informasi Geografis) memainkan peran penting dalam memahami bagaimana berbagai elemen spasial berinteraksi dalam skala lokal maupun global.",
      "Salah satu contoh penerapan pemahaman ruang modern adalah dalam perencanaan kota cerdas (smart city). Dengan menggunakan data spasial yang dikumpulkan dari berbagai sumber seperti sensor, satelit, dan survei, perencana kota dapat mengoptimalkan tata ruang, transportasi, dan distribusi sumber daya. Misalnya, analisis spasial dapat membantu menentukan lokasi optimal untuk fasilitas publik seperti rumah sakit atau sekolah, dengan mempertimbangkan faktor-faktor seperti kepadatan penduduk, aksesibilitas, dan kebutuhan masyarakat.",
      "Selain itu, pemahaman ruang modern juga memainkan peran krusial dalam mitigasi bencana. Dengan memetakan daerah rawan bencana seperti banjir, gempa bumi, atau longsor, para ahli dapat mengembangkan strategi evakuasi dan penanggulangan yang lebih efektif. Teknologi seperti pemetaan 3D dan simulasi komputer memungkinkan prediksi yang lebih akurat tentang dampak bencana, sehingga langkah-langkah pencegahan dapat diambil sebelum bencana terjadi."
    ]
  },
  {
    title: "Teori Lokasi dan Interaksi Spasial",
    image_urls: ["/ilmudibalikpeta.png"],
    contents: [
      "Peta tidak hanya sekadar representasi visual dari permukaan bumi, tetapi juga merupakan hasil dari pemikiran mendalam tentang bagaimana manusia berinteraksi dengan ruang. Teori lokasi dan interaksi spasial menjadi fondasi utama dalam memahami pola-pola geografis yang terjadi di dunia nyata. Teori-teori ini membantu kita menjelaskan mengapa suatu aktivitas manusia, seperti pertanian, perdagangan, atau penyebaran inovasi, terjadi di tempat tertentu dan bagaimana interaksi antarwilayah terbentuk.",
      "Johann Heinrich von Thünen, seorang ekonom Jerman, mengembangkan teori lokasi pertanian pada awal abad ke-19. Teorinya berfokus pada bagaimana penggunaan lahan pertanian di sekitar kota dipengaruhi oleh biaya transportasi dan nilai ekonomi dari komoditas yang dihasilkan. Von Thünen berargumen bahwa jenis tanaman yang dibudidayakan di suatu wilayah akan tergantung pada jaraknya dari pasar atau kota.Menurut Von Thünen, komoditas yang memiliki nilai ekonomi tinggi tetapi mudah rusak, seperti sayuran dan buah-buahan, akan ditanam di dekat kota. Sementara itu, komoditas yang lebih tahan lama dan memiliki nilai ekonomi lebih rendah, seperti gandum atau ternak, akan ditanam di wilayah yang lebih jauh. Teori ini menggambarkan bagaimana manusia mengoptimalkan penggunaan lahan berdasarkan prinsip ekonomi.",
      "Walter Christaller, seorang geografer Jerman, memperkenalkan Teori Tempat Sentral pada tahun 1933. Teori ini menjelaskan bagaimana pusat-pusat aktivitas manusia, seperti kota atau pasar, tersebar dalam suatu wilayah. Christaller berargumen bahwa pola penyebaran ini mengikuti prinsip hierarki dan jarak yang teratur, dengan pusat-pusat yang lebih besar melayani wilayah yang lebih luas.",
      "Torsten Hägerstrand, seorang geografer Swedia, mengembangkan teori difusi inovasi pada pertengahan abad ke-20. Teorinya berfokus pada bagaimana ide, teknologi, atau budaya menyebar dari satu tempat ke tempat lain. Hägerstrand memperkenalkan konsep ruang-waktu, yang menggabungkan dimensi waktu dan ruang dalam memahami proses difusi.",
      "Teori Hägerstrand memiliki aplikasi yang luas, mulai dari perencanaan pembangunan hingga pemasaran. Dalam era digitalisasi, konsep ruang-waktu menjadi semakin relevan, terutama dalam memahami bagaimana informasi dan teknologi menyebar melalui jaringan global."
    ]
  },
  {
    title: "First Law of Geography",
    image_urls: ["/ilmudibalikpeta.png"],
    contents: [
      "Dalam studi geografi, terdapat prinsip dasar yang dikenal sebagai First Law of Geography atau Hukum Pertama Geografi. Hukum ini, yang dirumuskan oleh Waldo Tobler pada tahun 1970, menyatakan bahwa 'segala sesuatu berhubungan dengan segala sesuatu yang lain, tetapi hal-hal yang berdekatan lebih berhubungan daripada hal-hal yang jauh.' Prinsip ini menjadi fondasi bagi analisis spasial dan pemahaman tentang interaksi antarwilayah.",
      "Hukum Pertama Geografi mencerminkan realitas bahwa jarak memainkan peran penting dalam menentukan hubungan antara objek atau fenomena di permukaan bumi. Misalnya, dua kota yang berdekatan cenderung memiliki interaksi ekonomi dan sosial yang lebih intensif dibandingkan dengan kota yang terpisah jauh. Prinsip ini juga menjelaskan mengapa pola-pola geografis, seperti penyebaran penyakit atau migrasi penduduk, sering kali mengikuti pola spasial tertentu.",
      "Dalam konteks Sistem Informasi Geografis (SIG), Hukum Pertama Geografi menjadi dasar bagi pengembangan alat-alat analisis spasial. SIG memungkinkan kita untuk memvisualisasikan dan menganalisis hubungan spasial antara berbagai objek atau fenomena. Dengan memahami prinsip ini, kita dapat membuat keputusan yang lebih informasional dalam perencanaan wilayah, manajemen sumber daya, dan mitigasi bencana."
    ]
  }
])

# Course 4
seed_course("Awal Mula Sistem Informasi Geografis", "/awalmulasig.png", [
  {
    title: "Roger Tomlinson dan CGIS",
    image_urls: ["/awalmulasig.png"],
    contents: [
      "Sistem Informasi Geografis (SIG) tidak muncul secara tiba-tiba, melainkan melalui proses panjang yang melibatkan inovasi teknologi dan kebutuhan praktis. Salah satu tokoh kunci dalam sejarah SIG adalah Roger Tomlinson, yang dikenal sebagai 'Bapak SIG.' Tomlinson memimpin pengembangan Canada Geographic Information System (CGIS) pada tahun 1960-an, yang dianggap sebagai sistem SIG pertama di dunia.",
      "CGIS awalnya dirancang untuk membantu pemerintah Kanada dalam mengelola sumber daya alam, khususnya dalam inventarisasi lahan dan perencanaan penggunaan lahan. Sistem ini memungkinkan pengguna untuk menyimpan, menganalisis, dan memvisualisasikan data spasial secara digital, sebuah terobosan besar pada masanya. CGIS menjadi fondasi bagi pengembangan SIG modern, menunjukkan bagaimana teknologi dapat digunakan untuk memecahkan masalah geografis yang kompleks.",
      "Kontribusi Roger Tomlinson tidak hanya terbatas pada pengembangan CGIS. Ia juga memainkan peran penting dalam mempromosikan penggunaan SIG di berbagai bidang, seperti perencanaan kota, manajemen lingkungan, dan mitigasi bencana. Berkat upayanya, SIG berkembang dari sebuah proyek eksperimental menjadi alat yang indispensable dalam pengelolaan sumber daya dan pembuatan kebijakan.",
      "Canada Geographic Information System (CGIS) lahir pada tahun 1960-an sebagai respons terhadap kebutuhan pemerintah Kanada untuk mengelola sumber daya alam secara lebih efektif. Pada saat itu, Kanada menghadapi tantangan besar dalam menginventarisasi lahan dan merencanakan penggunaan lahan yang berkelanjutan. Roger Tomlinson, seorang geografer dan ahli sistem, diangkat untuk memimpin proyek ini.",
      "Proyek CGIS tidak hanya berhasil memenuhi tujuannya, tetapi juga menjadi model bagi pengembangan SIG di seluruh dunia. Sistem ini membuktikan bahwa teknologi komputer dapat digunakan untuk memecahkan masalah geografis yang kompleks, membuka jalan bagi era digitalisasi dalam geografi."
    ]
  },
  {
    title: "Peran Teknologi Komputer Awal",
    image_urls: ["/awalmulasig.png"],
    contents: [
      "Perkembangan SIG tidak lepas dari kemajuan teknologi komputer pada pertengahan abad ke-20. Pada masa itu, komputer mulai digunakan untuk memproses data dalam skala besar, termasuk data spasial. Kemampuan ini membuka peluang baru dalam analisis geografis, yang sebelumnya terbatas pada metode manual dan peta analog.",
      "Salah satu tantangan utama pada masa awal SIG adalah keterbatasan hardware dan software. Komputer pada saat itu memiliki kapasitas penyimpanan dan kecepatan pemrosesan yang terbatas. Namun, para pionir SIG berhasil mengatasi tantangan ini dengan mengembangkan algoritma dan teknik khusus untuk memproses data spasial.",
      "Pada masa awal SIG, hardware dan software untuk memproses data spasial masih sangat terbatas. Komputer pada saat itu memiliki kapasitas penyimpanan yang kecil dan kecepatan pemrosesan yang rendah. Namun, para pionir SIG berhasil mengembangkan teknik dan algoritma khusus untuk mengatasi keterbatasan ini.Salah satu inovasi penting adalah pengembangan format data spasial yang efisien. Format ini memungkinkan data spasial, seperti koordinat dan atribut, disimpan dalam bentuk digital. Selain itu, para peneliti juga mengembangkan software khusus untuk memproses data spasial, seperti sistem manajemen basis data geografis.",
      "Transisi ini tidak hanya meningkatkan efisiensi dalam pembuatan peta, tetapi juga membuka peluang untuk pengembangan aplikasi SIG yang lebih canggih. Misalnya, dengan menggunakan peta digital, para perencana kota dapat membuat model 3D untuk mensimulasikan perkembangan kota. Hal ini menunjukkan bagaimana teknologi digital telah mengubah cara kita memahami dan berinteraksi dengan ruang."
    ]
  },
  {
    title: "Implementasi Pemerintah",
    image_urls: ["/awalmulasig.png"],
    contents: [
      "Pemerintah merupakan salah satu pengguna awal SIG, memanfaatkan teknologi ini untuk perencanaan kota, manajemen sumber daya alam, dan pembangunan infrastruktur. SIG memungkinkan pemerintah untuk membuat keputusan yang lebih informasional berdasarkan data spasial yang akurat dan terupdate.",
      "Salah satu aplikasi utama SIG di pemerintahan adalah dalam perencanaan kota. Dengan menggunakan SIG, para perencana dapat menganalisis pola penggunaan lahan, memprediksi pertumbuhan penduduk, dan merencanakan infrastruktur yang berkelanjutan. SIG juga digunakan untuk mengidentifikasi area yang rentan terhadap bencana, membantu pemerintah dalam mitigasi dan respons bencana.",
      "Salah satu keuntungan utama SIG dalam perencanaan kota adalah kemampuannya untuk memvisualisasikan data dalam bentuk peta interaktif. Hal ini memungkinkan para perencana untuk melihat hubungan antara berbagai faktor, seperti kepadatan penduduk, aksesibilitas, dan ketersediaan sumber daya. Dengan demikian, SIG membantu dalam membuat keputusan yang lebih informasional dan efektif.",
      "Selain itu, SIG juga digunakan untuk memantau perkembangan kota secara real-time. Misalnya, dengan menggunakan data dari sensor dan citra satelit, pemerintah dapat memantau perubahan dalam penggunaan lahan dan mengambil tindakan jika diperlukan. Hal ini menunjukkan bagaimana SIG telah mengubah cara kita merencanakan dan mengelola kota."
    ]
  }
])

# Course 5
seed_course("SIG Modern dan Perkembangan Perangkat Lunak", "/sigmodern.png", [
  {
    title: "Era Komersialisasi SIG",
    image_urls: ["/sigmodern.png"],
    contents: [
      "Era komersialisasi SIG dimulai pada akhir abad ke-20, ketika perusahaan-perusahaan teknologi melihat potensi besar dalam pengembangan perangkat lunak SIG. Perusahaan seperti Esri, dengan produk andalannya ArcGIS, dan MapInfo menjadi pemain utama di pasar, menyediakan solusi SIG yang komprehensif untuk berbagai kebutuhan.",
      "ArcGIS, yang diluncurkan pada tahun 1999, menjadi standar de facto dalam industri SIG. Perangkat lunak ini menawarkan berbagai fitur canggih, seperti analisis spasial, visualisasi 3D, dan integrasi dengan data real-time. MapInfo, di sisi lain, fokus pada solusi SIG untuk bisnis, membantu perusahaan dalam analisis lokasi dan perencanaan pasar.",
      "Selain perangkat lunak komersial, perkembangan perangkat lunak open source juga menandai era komersialisasi SIG. QGIS, misalnya, menjadi alternatif populer bagi pengguna yang menginginkan solusi SIG yang terjangkau dan fleksibel. Perkembangan ini menunjukkan bahwa SIG tidak lagi terbatas pada kalangan tertentu, tetapi dapat diakses oleh siapa saja."
    ]
  },
  {
    title: "Digitalisasi Peta dan Sistem Koordinat Global",
    image_urls: ["/sigmodern.png"],
    contents: [
      "Digitalisasi peta telah mengubah cara kita menyimpan, menganalisis, dan membagikan data spasial. Dengan transformasi dari peta kertas ke digital, data spasial dapat diakses dan dimanipulasi dengan lebih mudah. Selain itu, sistem koordinat dan proyeksi peta modern memastikan akurasi dan konsistensi data spasial di seluruh dunia.",
      "Salah satu tantangan utama dalam digitalisasi peta adalah mengonversi data analog ke format digital. Proses ini melibatkan pemindaian peta kertas, digitasi fitur-fitur geografis, dan validasi data. Meskipun memakan waktu, digitalisasi peta membuka peluang baru dalam analisis geografis dan visualisasi data.",
      "Sistem koordinat global, seperti WGS84 (World Geodetic System 1984), juga memainkan peran penting dalam revolusi SIG. Sistem ini memastikan bahwa data spasial dari berbagai sumber dapat diintegrasikan dengan akurat, memungkinkan analisis yang lebih komprehensif dan kolaborasi global dalam pemetaan."
    ]
  },
  {
    title: "Internet dan Revolusi Geospasial",
    image_urls: ["/sigmodern.png"],
    contents: [
      "Internet telah membawa revolusi besar dalam dunia SIG, membuat data spasial dapat diakses oleh siapa saja, kapan saja, dan di mana saja. Platform seperti Google Maps dan OpenStreetMap telah mengubah cara kita berinteraksi dengan peta, menjadikannya bagian integral dari kehidupan sehari-hari.",
      "Google Maps, yang diluncurkan pada tahun 2005, adalah salah satu platform pemetaan paling populer di dunia. Dengan antarmuka yang user-friendly dan data yang terus diperbarui, Google Maps memungkinkan pengguna untuk menjelajahi dunia, mencari lokasi, dan merencanakan rute perjalanan.",
      "Di sisi lain, OpenStreetMap (OSM) menawarkan pendekatan yang lebih kolaboratif dalam pemetaan. Dijuluki 'Wikipedia of Maps,' OSM memungkinkan siapa saja untuk berkontribusi dalam pembuatan peta. Platform ini menjadi alternatif populer bagi pengguna yang menginginkan data spasial yang terbuka dan dapat diakses secara gratis."
    ]
  }
])

# Course 6
seed_course("Big Data, AI, dan Masa Depan Pemetaan", "/masadepan.webp", [
  {
    title: "AI dan Machine Learning dalam SIG",
    image_urls: ["/masadepan.webp"],
    contents: [
      "Kecerdasan buatan (AI) dan machine learning telah membawa perubahan besar dalam dunia SIG. Teknologi ini memungkinkan analisis data spasial yang lebih cepat, akurat, dan otomatis. Misalnya, AI dapat digunakan untuk memprediksi perubahan lahan, mendeteksi bencana, dan mengoptimalkan rute transportasi.",
      "Salah satu aplikasi utama AI dalam SIG adalah deteksi perubahan lahan. Dengan menggunakan algoritma machine learning, sistem dapat menganalisis citra satelit dan mengidentifikasi perubahan dalam penggunaan lahan, seperti deforestasi atau urbanisasi. Hal ini membantu pemerintah dan organisasi dalam mengambil tindakan pencegahan.",
      "AI juga digunakan untuk prediksi bencana, seperti banjir dan gempa bumi. Dengan menganalisis data historis dan real-time, sistem dapat memprediksi kemungkinan terjadinya bencana dan memberikan peringatan dini. Hal ini meningkatkan kesiapsiagaan dan mengurangi dampak bencana."
    ]
  },
  {
    title: "Sensor Real-time dan IoT",
    image_urls: ["/masadepan.webp"],
    contents: [
      "Sensor real-time dan Internet of Things (IoT) telah membawa perubahan besar dalam dunia SIG. Teknologi ini memungkinkan pengumpulan data spasial secara real-time, yang dapat digunakan untuk memantau lingkungan, mengoptimalkan sumber daya, dan meningkatkan kualitas hidup.",
      "Salah satu aplikasi utama sensor real-time adalah pemantauan lingkungan. Misalnya, sensor dapat digunakan untuk memantau kualitas udara, suhu, dan kelembaban di suatu wilayah. Data ini dapat diintegrasikan dengan SIG untuk membuat peta real-time yang menunjukkan kondisi lingkungan.",
      "IoT juga memainkan peran penting dalam konsep 'Digital Twin,' yaitu representasi digital dari dunia nyata. Dengan menggunakan data dari sensor dan SIG, Digital Twin dapat digunakan untuk mensimulasikan dan memprediksi perubahan dalam lingkungan, infrastruktur, dan masyarakat."
    ]
  },
  {
    title: "Cloud GIS",
    image_urls: ["/masadepan.webp"],
    contents: [
      "Cloud GIS telah mengubah cara kita menyimpan, menganalisis, dan membagikan data spasial. Dengan menggunakan teknologi cloud, data spasial dapat diakses dari mana saja, kapan saja, dan oleh siapa saja. Hal ini memungkinkan kolaborasi global dalam analisis spasial dan pengambilan keputusan.",
      "Salah satu keunggulan Cloud GIS adalah skalabilitasnya. Pengguna dapat menyimpan dan menganalisis data dalam skala besar tanpa perlu investasi dalam infrastruktur fisik. Selain itu, Cloud GIS juga menawarkan fleksibilitas, memungkinkan pengguna untuk memilih layanan yang sesuai dengan kebutuhan mereka.",
      "Cloud GIS juga memungkinkan integrasi data dari berbagai sumber, seperti sensor, citra satelit, dan data statistik. Hal ini memungkinkan analisis yang lebih komprehensif dan kolaborasi global dalam pemetaan dan pengelolaan sumber daya."
    ]
  }
])

# Course 7
seed_course("Tantangan dalam Penggunaan SIG", "/tantangan.png", [
  {
    title: "Akurasi dan Bias Data",
    image_urls: ["/tantangan.png"],
    contents: [
      "Akurasi data spasial adalah fondasi dari analisis SIG yang andal. Namun, masalah kualitas data, seperti ketidaklengkapan, ketidakakuratan, atau bias, sering kali menjadi tantangan besar. Data yang tidak akurat dapat menyebabkan kesalahan dalam analisis, yang pada akhirnya mempengaruhi keputusan dan kebijakan.",
      "Bias data juga menjadi masalah serius. Misalnya, data yang dikumpulkan dari wilayah perkotaan mungkin lebih lengkap daripada data dari wilayah pedesaan, menyebabkan analisis yang tidak seimbang. Dampaknya, kebijakan yang dihasilkan mungkin tidak adil atau tidak efektif bagi masyarakat di wilayah yang kurang terwakili.",
      "Kualitas data spasial merupakan faktor kritis dalam analisis SIG. Data yang tidak akurat, tidak lengkap, atau usang dapat menyebabkan kesalahan dalam analisis dan pengambilan keputusan. Misalnya, peta yang tidak diperbarui mungkin tidak mencerminkan perubahan terbaru dalam penggunaan lahan, yang dapat mempengaruhi perencanaan kota atau manajemen bencana.",
      "Untuk mengatasi masalah ini, diperlukan standar yang jelas dalam pengumpulan dan pengelolaan data spasial. Selain itu, penggunaan teknologi seperti sensor real-time dan citra satelit dapat membantu meningkatkan akurasi dan kelengkapan data."
    ]
  },
  {
    title: "Privasi dan Pengawasan",
    image_urls: ["/tantangan.png"],
    contents: [
      "Kemampuan SIG untuk mengumpulkan dan menganalisis data secara detail menimbulkan kekhawatiran tentang privasi dan pengawasan. Misalnya, data lokasi dari ponsel atau sensor dapat digunakan untuk melacak pergerakan individu, yang dapat melanggar privasi mereka.",
      "Penggunaan SIG untuk pengawasan massal juga menjadi isu kontroversial. Di satu sisi, teknologi ini dapat membantu meningkatkan keamanan dan penegakan hukum. Di sisi lain, penggunaan yang berlebihan atau tidak transparan dapat mengancam kebebasan sipil dan hak asasi manusia.",
      "Salah satu contoh adalah penggunaan data lokasi untuk iklan yang ditargetkan. Meskipun ini dapat meningkatkan efektivitas pemasaran, hal ini juga menimbulkan kekhawatiran tentang bagaimana data pribadi dikumpulkan dan digunakan. Selain itu, data lokasi juga dapat disalahgunakan untuk tujuan yang tidak etis, seperti penguntitan atau pemantauan tanpa izin."
    ]
  },
  {
    title: "Ketimpangan Akses Teknologi",
    image_urls: ["/tantangan.png"],
    contents: [
      "Ketimpangan akses teknologi adalah tantangan besar dalam penggunaan SIG. Negara-negara berkembang seringkali tertinggal dalam hal infrastruktur dan sumber daya untuk memanfaatkan SIG secara optimal. Hal ini menciptakan kesenjangan antara negara maju dan berkembang dalam hal kemampuan analisis dan pengambilan keputusan berbasis data spasial.",
      "Upaya untuk meningkatkan aksesibilitas SIG, seperti pelatihan dan pengembangan perangkat lunak open source, menjadi kunci untuk mengurangi kesenjangan ini. Selain itu, kolaborasi internasional juga penting untuk membantu negara-negara berkembang dalam mengadopsi dan memanfaatkan teknologi SIG.",
      "Selain itu, organisasi internasional dan lembaga pendidikan juga berperan penting dalam meningkatkan aksesibilitas SIG. Misalnya, program pelatihan dan beasiswa dapat membantu meningkatkan keahlian dan kapasitas sumber daya manusia di negara-negara berkembang.Upaya ini tidak hanya membantu mengurangi kesenjangan teknologi, tetapi juga memungkinkan lebih banyak orang untuk memanfaatkan SIG dalam pengambilan keputusan dan perencanaan pembangunan."
    ]
  }
])

# Course 8
seed_course("Merekam Dunia yang Terus Berubah", "/merekamduniamasadepan.png", [
  {
    title: "Pemahaman Ruang Modern",
    image_urls: ["/merekamduniamasadepan.png"],
    contents: [
      "Sistem Informasi Geografis (SIG) akan menjadi tulang punggung dalam pembangunan kota masa depan atau smart city. Dengan kemampuan analisis spasial yang canggih, SIG memungkinkan pengelolaan sumber daya yang lebih efisien, perencanaan tata ruang yang optimal, dan peningkatan kualitas hidup penduduk. Kota-kota modern akan semakin mengandalkan SIG untuk mengintegrasikan data dari berbagai sumber, seperti sensor, IoT, dan citra satelit, guna menciptakan lingkungan yang berkelanjutan dan responsif.",
      "Salah satu aplikasi utama SIG dalam smart city adalah perencanaan transportasi. Dengan menganalisis pola pergerakan penduduk dan lalu lintas, SIG dapat membantu mengoptimalkan rute transportasi umum, mengurangi kemacetan, dan meningkatkan efisiensi logistik. Selain itu, SIG juga digunakan dalam manajemen energi, seperti memetakan sumber energi terbarukan dan mengoptimalkan distribusi energi.",
      "Dengan dukungan SIG, kota-kota masa depan tidak hanya akan menjadi lebih cerdas, tetapi juga lebih inklusif dan ramah lingkungan. Teknologi ini memungkinkan pengambilan keputusan berbasis data yang akurat, membantu pemerintah dan perencana kota dalam menciptakan solusi yang berkelanjutan untuk tantangan urbanisasi yang semakin kompleks."
    ]
  },
  {
    title: "SIG dalam Perubahan Iklim dan Mitigasi Bencana",
    image_urls: ["/merekamduniamasadepan.png"],
    contents: [
      "Perubahan iklim dan bencana alam merupakan tantangan global yang memerlukan solusi berbasis data. SIG memainkan peran penting dalam pemantauan perubahan iklim dan mitigasi bencana, dengan kemampuannya untuk menganalisis data spasial secara real-time dan memprediksi dampak lingkungan.",
      "Salah satu aplikasi utama SIG dalam perubahan iklim adalah pemantauan kenaikan permukaan laut dan deforestasi. Dengan menggunakan citra satelit dan data sensor, SIG dapat membantu mengidentifikasi area yang rentan terhadap dampak perubahan iklim, seperti banjir atau kekeringan. Data ini dapat digunakan untuk membuat kebijakan yang berkelanjutan dan mengurangi dampak lingkungan.",
      "Dalam mitigasi bencana, SIG digunakan untuk memprediksi bencana dan merencanakan respons darurat. Misalnya, SIG dapat membantu mengidentifikasi area yang rentan terhadap gempa bumi atau banjir, serta merencanakan evakuasi yang aman. Dengan dukungan SIG, pemerintah dan organisasi dapat meningkatkan kesiapsiagaan dan mengurangi dampak bencana."
    ]
  },
  {
    title: "Masa Depan Pemetaan",
    image_urls: ["/merekamduniamasadepan.png"],
    contents: [
      "Masa depan pemetaan akan dipengaruhi oleh kemajuan teknologi, seperti eksplorasi luar angkasa dan augmented reality (AR). SIG akan memainkan peran penting dalam pemetaan planet lain, seperti Mars, sementara AR akan mengubah cara kita berinteraksi dengan peta di dunia nyata.",
      "Salah satu aplikasi masa depan SIG adalah pemetaan planet lain. Misalnya, SIG digunakan untuk memetakan permukaan Mars dan mendukung misi eksplorasi. Data ini dapat digunakan untuk mengidentifikasi lokasi yang cocok untuk pendaratan dan kolonisasi.",
      "Selain itu, augmented reality akan mengubah cara kita menggunakan peta. Misalnya, AR dapat digunakan untuk menampilkan informasi spasial secara real-time, seperti arah jalan atau informasi tentang objek di sekitar kita. Teknologi ini akan membuat pemetaan lebih interaktif dan imersif."
    ]
  }
])


puts "✅ Seed data courses berhasil dibuat!"
