## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
- Stateless widget adalah widget yang tidak bisa mengalami perubahan melalui internal action. Widget tersebut baru dapat berubah apabila pemicunya berupa external event dari parent widgetnya. Stateless widget hanya memiliki final properties, description terkait dirinya ia dapat dari parent widgetnya. Contoh dari stateless widget adalah Icon, IconButton, dan Text. 
- Stateful widget adalah widget yang dapat mengalami perubahan jika terdapat trigger dari interaksi user dengan dirinya. Stateful widget bersifat dinamis, deskripsinya juga akan berubah secara dinamis selama penggunaan widget tersebut. Contoh dari stateful widget adalah Checkbox, Radio, dan Slider. 


## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Scaffold : untuk mengatur layout dari widget yang ada di dalamnya
- Text : untuk menampilkan text dengan format style tertentu
- FloatingActionButton : untuk menampilkan button yang dapat melakukan suatu action
- Row : untuk memposisikan beberapa widget dengan layout secara horizontal
- Column : untuk memposisikan widget secara vertikal
- Padding : untuk menambahkan dan mengatur set padding atau space kosong 
- Center : untuk memposisikan elemen ke tengah bagian
- Icon : untuk menggunakan icon pada sebuah elemen
- Expanded : untuk membuat jarak kosong antar elemen 


## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi dari setState adalah untuk memberi tahu framework bahwa internal state objek terkait telah berubah karena adanya action yang mungkin memengaruhi interface pengguna di subtree ini menyebabkan framework menjadwalkan build untuk objek status ini. Jika hanya mengubah status secara langsung tanpa memanggil setState, interface untuk subtree ini mungkin tidak terpebaharui untuk mencerminkan status baru. 

## Jelaskan perbedaan antara const dengan final.
- Keyword final berfungsi untuk mendeklarasikan suatu variabel yang bersifat immutable. Variabel dengan keyword final baru akan bersifat immutable saat runtime. Dengan begitu, value dari variabel final bisa ditetapkan dari awal maupun saat kompilasi berjalan. Dengan begitu valuenya baru akan diketahui saat runtime.
- Keyword const berfungsi untuk mendeklarasikan suatu variabel yang bersifat immutable dan konstan. Value dari variabelnya harus ditetapkan sejak awal. Sehingga pada saat compile, variabel tersebut sudah memiliki nilai. Value pada variabel const harus diinisialisasi secara eksplisit, tidak seperti final.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
- Membuat app dengan perintah flutter create counter_7
- Melakukan modifikasi pada file lib/main.dart, yaitu:
    - Menambahkan floating action button baru dengan icon remove (-) 
    - Membuat fungsi decrement pada onpressed button
    - Menambahkan padding dan expanded untuk mengatur jarak dan posisi dua button
    - Membuat kondisi if else pada bagian widget text, warna dan texnya disesuaikan dengan kondisi counternya
    - Membuat kondisi if else pada bagian widget button decrement agar invisible saat counternya 0
- Add, commit, push ke repo github
