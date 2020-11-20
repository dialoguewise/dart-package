class Content
{
  ///Sets the country that you would like to target.
  Country country;

  ///Sets the device that you would like to target.
  Device deviceType;

  ///Sets the sentiment that you would like to target.
  Sentiment sentimentType;

  ///The fields and their corresponding values.
  List<Field> fields;

  ///The content id. Used for update or delete opration.
  String id;

  Map<String, dynamic> toJson() =>
  {
    'countryCode': country.Code,
    'deviceType': deviceType.Name,
    'sentiment': sentimentType.Type,
    'fields': fields,
    'id':id
  };
}

class Field
{
  String name;
  String value;

  Map<String, dynamic> toJson() =>
  {
    'name': name,
    'value': value
  };
}

enum Device{
  Any,
  Desktop,
  Mobile
}

extension DeviceType on Device
{
  String get Name
  {
    switch(this)
    {
      case Device.Desktop: return "Desktop";
      case Device.Mobile: return "Mobile";
      default: return null;
    }
  }
}

enum Sentiment{
  Any,
  Positive,
  Neutral,
  Negative
}

extension SentimentType on Sentiment
{
  String get Type
  {
    switch(this)
    {
      case Sentiment.Positive: return "Positive";
      case Sentiment.Neutral: return "Neutral";
      case Sentiment.Negative: return "Negative";
      default: return null;
    }
  }
}

enum Country
{
    Any,
    Afghanistan
    , Albania
    , Algeria
    , American_Samoa
    , Andorra
    , Angola
    , Anguilla
    , Antarctica
    , Antigua_and_Barbuda
    , Argentina
    , Armenia
    , Aruba
    , Australia
    , Austria
    , Azerbaijan
    , Bahamas
    , Bahrain
    , Bangladesh
    , Barbados
    , Belarus
    , Belgium
    , Belize
    , Benin
    , Bermuda
    , Bhutan
    , Bolivia
    , Bosnia_and_Herzegovina
    , Botswana
    , Brazil
    , British_Indian_Ocean_Territory
    , British_Virgin_Islands
    , Brunei
    , Bulgaria
    , Burkina_Faso
    , Burundi
    , Cambodia
    , Cameroon
    , Canada
    , Cape_Verde
    , Cayman_Islands
    , Central_African_Republic
    , Chad
    , Chile
    , China
    , Christmas_Island
    , Cocos_Islands
    , Colombia
    , Comoros
    , Cook_Islands
    , Costa_Rica
    , Croatia
    , Cuba
    , Curacao
    , Cyprus
    , Czech_Republic
    , Democratic_Republic_of_the_Congo
    , Denmark
    , Djibouti
    , Dominica
    , Dominican_Republic
    , East_Timor
    , Ecuador
    , Egypt
    , El_Salvador
    , Equatorial_Guinea
    , Eritrea
    , Estonia
    , Ethiopia
    , Falkland_Islands
    , Faroe_Islands
    , Fiji
    , Finland
    , France
    , French_Polynesia
    , Gabon
    , Gambia
    , Georgia
    , Germany
    , Ghana
    , Gibraltar
    , Greece
    , Greenland
    , Grenada
    , Guam
    , Guatemala
    , Guernsey
    , Guinea
    , Guinea_Bissau
    , Guyana
    , Haiti
    , Honduras
    , Hong_Kong
    , Hungary
    , Iceland
    , India
    , Indonesia
    , Iran
    , Iraq
    , Ireland
    , Isle_of_Man
    , Israel
    , Italy
    , Ivory_Coast
    , Jamaica
    , Japan
    , Jersey
    , Jordan
    , Kazakhstan
    , Kenya
    , Kiribati
    , Kosovo
    , Kuwait
    , Kyrgyzstan
    , Laos
    , Latvia
    , Lebanon
    , Lesotho
    , Liberia
    , Libya
    , Liechtenstein
    , Lithuania
    , Luxembourg
    , Macau
    , Macedonia
    , Madagascar
    , Malawi
    , Malaysia
    , Maldives
    , Mali
    , Malta
    , Marshall_Islands
    , Mauritania
    , Mauritius
    , Mayotte
    , Mexico
    , Micronesia
    , Moldova
    , Monaco
    , Mongolia
    , Montenegro
    , Montserrat
    , Morocco
    , Mozambique
    , Myanmar
    , Namibia
    , Nauru
    , Nepal
    , Netherlands
    , Netherlands_Antilles
    , New_Caledonia
    , New_Zealand
    , Nicaragua
    , Niger
    , Nigeria
    , Niue
    , North_Korea
    , Northern_Mariana_Islands
    , Norway
    , Oman
    , Pakistan
    , Palau
    , Palestine
    , Panama
    , Papua_New_Guinea
    , Paraguay
    , Peru
    , Philippines
    , Pitcairn
    , Poland
    , Portugal
    , Puerto_Rico
    , Qatar
    , Republic_of_the_Congo
    , Reunion
    , Romania
    , Russia
    , Rwanda
    , Saint_Barthelemy
    , Saint_Helena
    , Saint_Kitts_and_Nevis
    , Saint_Lucia
    , Saint_Martin
    , Saint_Pierre_and_Miquelon
    , Saint_Vincent_and_the_Grenadines
    , Samoa
    , San_Marino
    , Sao_Tome_and_Principe
    , Saudi_Arabia
    , Senegal
    , Serbia
    , Seychelles
    , Sierra_Leone
    , Singapore
    , Sint_Maarten
    , Slovakia
    , Slovenia
    , Solomon_Islands
    , Somalia
    , South_Africa
    , South_Korea
    , South_Sudan
    , Spain
    , Sri_Lanka
    , Sudan
    , Suriname
    , Svalbard_and_Jan_Mayen
    , Swaziland
    , Sweden
    , Switzerland
    , Syria
    , Taiwan
    , Tajikistan
    , Tanzania
    , Thailand
    , Togo
    , Tokelau
    , Tonga
    , Trinidad_and_Tobago
    , Tunisia
    , Turkey
    , Turkmenistan
    , Turks_and_Caicos_Islands
    , Tuvalu
    , US_Virgin_Islands
    , Uganda
    , Ukraine
    , United_Arab_Emirates
    , United_Kingdom
    , United_States
    , Uruguay
    , Uzbekistan
    , Vanuatu
    , Vatican
    , Venezuela
    , Vietnam
    , Wallis_and_Futuna
    , Western_Sahara
    , Yemen
    , Zambia
    , Zimbabwe
}

extension CountryCode on Country
{
  String get Code
  {
    switch(this)
    {
      case Country.Afghanistan: return "AF";
      case Country.Albania: return "AL";
      case Country.Algeria: return "DZ";
      case Country.American_Samoa: return "AS";
      case Country.Andorra: return "AD";
      case Country.Angola: return "AO";
      case Country.Anguilla: return "AI";
      case Country.Antarctica: return "AQ";
      case Country.Antigua_and_Barbuda: return "AG";
      case Country.Argentina: return "AR";
      case Country.Armenia: return "AM";
      case Country.Aruba: return "AW";
      case Country.Australia: return "AU";
      case Country.Austria: return "AT";
      case Country.Azerbaijan: return "AZ";
      case Country.Bahamas: return "BS";
      case Country.Bahrain: return "BH";
      case Country.Bangladesh: return "BD";
      case Country.Barbados: return "BB";
      case Country.Belarus: return "BY";
      case Country.Belgium: return "BE";
      case Country.Belize: return "BZ";
      case Country.Benin: return "BJ";
      case Country.Bermuda: return "BM";
      case Country.Bhutan: return "BT";
      case Country.Bolivia: return "BO";
      case Country.Bosnia_and_Herzegovina: return "BA";
      case Country.Botswana: return "BW";
      case Country.Brazil: return "BR";
      case Country.British_Indian_Ocean_Territory: return "IO";
      case Country.British_Virgin_Islands: return "VG";
      case Country.Brunei: return "BN";
      case Country.Bulgaria: return "BG";
      case Country.Burkina_Faso: return "BF";
      case Country.Burundi: return "BI";
      case Country.Cambodia: return "KH";
      case Country.Cameroon: return "CM";
      case Country.Canada: return "CA";
      case Country.Cape_Verde: return "CV";
      case Country.Cayman_Islands: return "KY";
      case Country.Central_African_Republic: return "CF";
      case Country.Chad: return "TD";
      case Country.Chile: return "CL";
      case Country.China: return "CN";
      case Country.Christmas_Island: return "CX";
      case Country.Cocos_Islands: return "CC";
      case Country.Colombia: return "CO";
      case Country.Comoros: return "KM";
      case Country.Cook_Islands: return "CK";
      case Country.Costa_Rica: return "CR";
      case Country.Croatia: return "HR";
      case Country.Cuba: return "CU";
      case Country.Curacao: return "CW";
      case Country.Cyprus: return "CY";
      case Country.Czech_Republic: return "CZ";
      case Country.Democratic_Republic_of_the_Congo: return "CD";
      case Country.Denmark: return "DK";
      case Country.Djibouti: return "DJ";
      case Country.Dominica: return "DM";
      case Country.Dominican_Republic: return "DO";
      case Country.East_Timor: return "TL";
      case Country.Ecuador: return "EC";
      case Country.Egypt: return "EG";
      case Country.El_Salvador: return "SV";
      case Country.Equatorial_Guinea: return "GQ";
      case Country.Eritrea: return "ER";
      case Country.Estonia: return "EE";
      case Country.Ethiopia: return "ET";
      case Country.Falkland_Islands: return "FK";
      case Country.Faroe_Islands: return "FO";
      case Country.Fiji: return "FJ";
      case Country.Finland: return "FI";
      case Country.France: return "FR";
      case Country.French_Polynesia: return "PF";
      case Country.Gabon: return "GA";
      case Country.Gambia: return "GM";
      case Country.Georgia: return "GE";
      case Country.Germany: return "DE";
      case Country.Ghana: return "GH";
      case Country.Gibraltar: return "GI";
      case Country.Greece: return "GR";
      case Country.Greenland: return "GL";
      case Country.Grenada: return "GD";
      case Country.Guam: return "GU";
      case Country.Guatemala: return "GT";
      case Country.Guernsey: return "GG";
      case Country.Guinea: return "GN";
      case Country.Guinea_Bissau: return "GW";
      case Country.Guyana: return "GY";
      case Country.Haiti: return "HT";
      case Country.Honduras: return "HN";
      case Country.Hong_Kong: return "HK";
      case Country.Hungary: return "HU";
      case Country.Iceland: return "IS";
      case Country.India: return "IN";
      case Country.Indonesia: return "ID";
      case Country.Iran: return "IR";
      case Country.Iraq: return "IQ";
      case Country.Ireland: return "IE";
      case Country.Isle_of_Man: return "IM";
      case Country.Israel: return "IL";
      case Country.Italy: return "IT";
      case Country.Ivory_Coast: return "CI";
      case Country.Jamaica: return "JM";
      case Country.Japan: return "JP";
      case Country.Jersey: return "JE";
      case Country.Jordan: return "JO";
      case Country.Kazakhstan: return "KZ";
      case Country.Kenya: return "KE";
      case Country.Kiribati: return "KI";
      case Country.Kosovo: return "XK";
      case Country.Kuwait: return "KW";
      case Country.Kyrgyzstan: return "KG";
      case Country.Laos: return "LA";
      case Country.Latvia: return "LV";
      case Country.Lebanon: return "LB";
      case Country.Lesotho: return "LS";
      case Country.Liberia: return "LR";
      case Country.Libya: return "LY";
      case Country.Liechtenstein: return "LI";
      case Country.Lithuania: return "LT";
      case Country.Luxembourg: return "LU";
      case Country.Macau: return "MO";
      case Country.Macedonia: return "MK";
      case Country.Madagascar: return "MG";
      case Country.Malawi: return "MW";
      case Country.Malaysia: return "MY";
      case Country.Maldives: return "MV";
      case Country.Mali: return "ML";
      case Country.Malta: return "MT";
      case Country.Marshall_Islands: return "MH";
      case Country.Mauritania: return "MR";
      case Country.Mauritius: return "MU";
      case Country.Mayotte: return "YT";
      case Country.Mexico: return "MX";
      case Country.Micronesia: return "FM";
      case Country.Moldova: return "MD";
      case Country.Monaco: return "MC";
      case Country.Mongolia: return "MN";
      case Country.Montenegro: return "ME";
      case Country.Montserrat: return "MS";
      case Country.Morocco: return "MA";
      case Country.Mozambique: return "MZ";
      case Country.Myanmar: return "MM";
      case Country.Namibia: return "NA";
      case Country.Nauru: return "NR";
      case Country.Nepal: return "NP";
      case Country.Netherlands: return "NL";
      case Country.Netherlands_Antilles: return "AN";
      case Country.New_Caledonia: return "NC";
      case Country.New_Zealand: return "NZ";
      case Country.Nicaragua: return "NI";
      case Country.Niger: return "NE";
      case Country.Nigeria: return "NG";
      case Country.Niue: return "NU";
      case Country.North_Korea: return "KP";
      case Country.Northern_Mariana_Islands: return "MP";
      case Country.Norway: return "NO";
      case Country.Oman: return "OM";
      case Country.Pakistan: return "PK";
      case Country.Palau: return "PW";
      case Country.Palestine: return "PS";
      case Country.Panama: return "PA";
      case Country.Papua_New_Guinea: return "PG";
      case Country.Paraguay: return "PY";
      case Country.Peru: return "PE";
      case Country.Philippines: return "PH";
      case Country.Pitcairn: return "PN";
      case Country.Poland: return "PL";
      case Country.Portugal: return "PT";
      case Country.Puerto_Rico: return "PR";
      case Country.Qatar: return "QA";
      case Country.Republic_of_the_Congo: return "CG";
      case Country.Reunion: return "RE";
      case Country.Romania: return "RO";
      case Country.Russia: return "RU";
      case Country.Rwanda: return "RW";
      case Country.Saint_Barthelemy: return "BL";
      case Country.Saint_Helena: return "SH";
      case Country.Saint_Kitts_and_Nevis: return "KN";
      case Country.Saint_Lucia: return "LC";
      case Country.Saint_Martin: return "MF";
      case Country.Saint_Pierre_and_Miquelon: return "PM";
      case Country.Saint_Vincent_and_the_Grenadines: return "VC";
      case Country.Samoa: return "WS";
      case Country.San_Marino: return "SM";
      case Country.Sao_Tome_and_Principe: return "ST";
      case Country.Saudi_Arabia: return "SA";
      case Country.Senegal: return "SN";
      case Country.Serbia: return "RS";
      case Country.Seychelles: return "SC";
      case Country.Sierra_Leone: return "SL";
      case Country.Singapore: return "SG";
      case Country.Sint_Maarten: return "SX";
      case Country.Slovakia: return "SK";
      case Country.Slovenia: return "SI";
      case Country.Solomon_Islands: return "SB";
      case Country.Somalia: return "SO";
      case Country.South_Africa: return "ZA";
      case Country.South_Korea: return "KR";
      case Country.South_Sudan: return "SS";
      case Country.Spain: return "ES";
      case Country.Sri_Lanka: return "LK";
      case Country.Sudan: return "SD";
      case Country.Suriname: return "SR";
      case Country.Svalbard_and_Jan_Mayen: return "SJ";
      case Country.Swaziland: return "SZ";
      case Country.Sweden: return "SE";
      case Country.Switzerland: return "CH";
      case Country.Syria: return "SY";
      case Country.Taiwan: return "TW";
      case Country.Tajikistan: return "TJ";
      case Country.Tanzania: return "TZ";
      case Country.Thailand: return "TH";
      case Country.Togo: return "TG";
      case Country.Tokelau: return "TK";
      case Country.Tonga: return "TO";
      case Country.Trinidad_and_Tobago: return "TT";
      case Country.Tunisia: return "TN";
      case Country.Turkey: return "TR";
      case Country.Turkmenistan: return "TM";
      case Country.Turks_and_Caicos_Islands: return "TC";
      case Country.Tuvalu: return "TV";
      case Country.US_Virgin_Islands: return "VI";
      case Country.Uganda: return "UG";
      case Country.Ukraine: return "UA";
      case Country.United_Arab_Emirates: return "AE";
      case Country.United_Kingdom: return "GB";
      case Country.United_States: return "US";
      case Country.Uruguay: return "UY";
      case Country.Uzbekistan: return "UZ";
      case Country.Vanuatu: return "VU";
      case Country.Vatican: return "VA";
      case Country.Venezuela: return "VE";
      case Country.Vietnam: return "VN";
      case Country.Wallis_and_Futuna: return "WF";
      case Country.Western_Sahara: return "EH";
      case Country.Yemen: return "YE";
      case Country.Zambia: return "ZM";
      case Country.Zimbabwe: return "ZW";
      default: return null;
    }
  }
}