const LOGIN = 'login'; //POST

const REGISTER = 'register'; //POST

const TOKEN = 'sanctum/token'; //POST

const REVOKE = 'user/revoke'; // GET / authentication barer token
 
 // ---------------//
// العقارات والسيارات يلي بكونو تحت
///****************** Done */
 const MALKANS_AR = 'malkans/ar';
 const MALKANS_EN = 'malkans/en';
//شريط العقارات
///****************** Done */
 const CATEGORIES_AR = 'categories/ar';
 const CATEGORIES_EN = 'categories/en';
//بيعرضلي عقارات تصنيف معين بناء على رقمو
//مثلا رقم 6 بيعرضلي الفلل ورقم 4 كل الشقق
///****************** Done */
 const CATEGORY_AR = 'category/ar'; // /$id';
 const CATEGORY_EN = 'category/en'; // /$id';

//لعرض تفاصيل العقار نفسو
//**********مو شغاااااال******/
 const PROPORTY_AR = 'proporty/ar'; // /$id';
 const PROPORTY_EN = 'proporty/en'; // /$id';
 //**********مو شغاااااال******/

//شريط المدن
///****************** Done */
 const CITIES_AR = 'cites/ar';
 const CITIES_EN = 'cites/en';
//بعطيه رقم المدينة بيعطيني كل العقارات يلي جواتها
//propoties in city model 
///****************** Done */
 const CITY_AR = 'city/ar/2'; // /$id';
 const CITY_EN = 'city/en'; // /$id';
//لعرض تفاصيل السيارة بناء ع رقها
///****************** Done */
 const CAR_AR = 'car/ar/1';
 const CAR_EN = 'car/en/1';
//عرض كل السيارات
//car list model ///****************** Done */
 const CARS_AR = 'car_list/ar/1';//id
 const CARS_EN = 'car_list/en/1';//id
//عرض كل العقارات
///****************** Done */
 const SHOW_PROPERTIES_AR = 'show_properties/ar/';
 const SHOW_PROPERTIES_EN = 'show_properties/en/';

 const LIKEORUNLIKE = 'malkan/{id}/likes';
 const LIKEORUNLIKECAR = 'cars/{id}/likes';



