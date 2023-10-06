import 'dart:convert';
import 'package:chandraprakash_s_application1/core/app_export.dart';
import 'package:chandraprakash_s_application1/data/My_Toast.dart';
import 'package:chandraprakash_s_application1/data/constants.dart';
import 'package:chandraprakash_s_application1/presentation/map_screen/models/map_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../store_locator_screen/route_locator_screen.dart';

class MapController extends GetxController {
  TextEditingController inputFieldController = TextEditingController();
  TextEditingController inputFieldOneController = TextEditingController();
  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  Rx<MapModel> mapModelObj = MapModel().obs;
var routeList=<String>[].obs;
getData(){
  var o = json.decode('[{"stop_id":"1","stop_code":"","stop_name":"Dilshad Garden","stop_desc":"","stop_lat":"28.675991","stop_lon":"77.321495"},{"stop_id":"2","stop_code":"","stop_name":"Jhilmil","stop_desc":"","stop_lat":"28.675648","stop_lon":"77.312393"},{"stop_id":"3","stop_code":"","stop_name":"Mansrover park","stop_desc":"","stop_lat":"28.675352","stop_lon":"77.301178"},{"stop_id":"4","stop_code":"","stop_name":"Shahdara","stop_desc":"","stop_lat":"28.673531","stop_lon":"77.28727"},{"stop_id":"5","stop_code":"","stop_name":"Welcome","stop_desc":"","stop_lat":"28.671986","stop_lon":"77.277931"},{"stop_id":"6","stop_code":"","stop_name":"Seelam Pur","stop_desc":"","stop_lat":"28.670324","stop_lon":"77.267311"},{"stop_id":"7","stop_code":"","stop_name":"Shastri Park","stop_desc":"","stop_lat":"28.668451","stop_lon":"77.250404"},{"stop_id":"8","stop_code":"","stop_name":"Kashmere Gate","stop_desc":"","stop_lat":"28.667879","stop_lon":"77.228012"},{"stop_id":"9","stop_code":"","stop_name":"Tis Hazari","stop_desc":"","stop_lat":"28.667137","stop_lon":"77.216721"},{"stop_id":"10","stop_code":"","stop_name":"Pul Bangash","stop_desc":"","stop_lat":"28.66571","stop_lon":"77.206329"},{"stop_id":"11","stop_code":"","stop_name":"Pratap Nagar","stop_desc":"","stop_lat":"28.666632","stop_lon":"77.196869"},{"stop_id":"12","stop_code":"","stop_name":"Shastri Nagar","stop_desc":"","stop_lat":"28.670135","stop_lon":"77.181679"},{"stop_id":"13","stop_code":"","stop_name":"Inderlok","stop_desc":"","stop_lat":"28.673452","stop_lon":"77.170235"},{"stop_id":"14","stop_code":"","stop_name":"Kanhaiya Nagar","stop_desc":"","stop_lat":"28.682386","stop_lon":"77.162552"},{"stop_id":"15","stop_code":"","stop_name":"Keshav Puram","stop_desc":"","stop_lat":"28.688944","stop_lon":"77.161774"},{"stop_id":"16","stop_code":"","stop_name":"Netaji Subash Place","stop_desc":"","stop_lat":"28.695637","stop_lon":"77.152428"},{"stop_id":"17","stop_code":"","stop_name":"Kohat Enclave","stop_desc":"","stop_lat":"28.697943","stop_lon":"77.140465"},{"stop_id":"18","stop_code":"","stop_name":"Pitampura","stop_desc":"","stop_lat":"28.70318","stop_lon":"77.132355"},{"stop_id":"19","stop_code":"","stop_name":"Rohini East","stop_desc":"","stop_lat":"28.707941","stop_lon":"77.125732"},{"stop_id":"20","stop_code":"","stop_name":"Rohini West","stop_desc":"","stop_lat":"28.715008","stop_lon":"77.115746"},{"stop_id":"21","stop_code":"","stop_name":"Rithala","stop_desc":"","stop_lat":"28.720821","stop_lon":"77.105042"},{"stop_id":"22","stop_code":"","stop_name":"Mundka","stop_desc":"","stop_lat":"28.682411","stop_lon":"77.028282"},{"stop_id":"23","stop_code":"","stop_name":"Rajdhani Park","stop_desc":"","stop_lat":"28.682217","stop_lon":"77.043869"},{"stop_id":"24","stop_code":"","stop_name":"Nangloi Railway Station","stop_desc":"","stop_lat":"28.682091","stop_lon":"77.05619"},{"stop_id":"25","stop_code":"","stop_name":"Nangloi","stop_desc":"","stop_lat":"28.682356","stop_lon":"77.064728"},{"stop_id":"26","stop_code":"","stop_name":"Maharaja Surajmal Stadium","stop_desc":"","stop_lat":"28.681833","stop_lon":"77.073891"},{"stop_id":"27","stop_code":"","stop_name":"Udyog Nagar","stop_desc":"","stop_lat":"28.681047","stop_lon":"77.078674"},{"stop_id":"28","stop_code":"","stop_name":"Peera Garhi","stop_desc":"","stop_lat":"28.67972","stop_lon":"77.092491"},{"stop_id":"29","stop_code":"","stop_name":"Paschim Vihar (West)","stop_desc":"","stop_lat":"28.678539","stop_lon":"77.102119"},{"stop_id":"30","stop_code":"","stop_name":"Paschim Vihar (East)","stop_desc":"","stop_lat":"28.677305","stop_lon":"77.112251"},{"stop_id":"31","stop_code":"","stop_name":"Madipur","stop_desc":"","stop_lat":"28.676418","stop_lon":"77.117294"},{"stop_id":"32","stop_code":"","stop_name":"Shivaji Park","stop_desc":"","stop_lat":"28.674965","stop_lon":"77.128258"},{"stop_id":"33","stop_code":"","stop_name":"Punjabi Bagh","stop_desc":"","stop_lat":"28.672943","stop_lon":"77.146011"},{"stop_id":"34","stop_code":"","stop_name":"Ashok Park Main","stop_desc":"","stop_lat":"28.671572","stop_lon":"77.155159"},{"stop_id":"35","stop_code":"","stop_name":"Satguru Ram Singh Marg","stop_desc":"","stop_lat":"28.662188","stop_lon":"77.157829"},{"stop_id":"36","stop_code":"","stop_name":"Samaypur Badli","stop_desc":"","stop_lat":"28.742872","stop_lon":"77.146545"},{"stop_id":"37","stop_code":"","stop_name":"Rohini Sector 18-19","stop_desc":"","stop_lat":"28.740192","stop_lon":"77.135574"},{"stop_id":"38","stop_code":"","stop_name":"Haiderpur Badli Mor","stop_desc":"","stop_lat":"28.718657","stop_lon":"77.149956"},{"stop_id":"39","stop_code":"","stop_name":"Jahangirpuri","stop_desc":"","stop_lat":"28.72818","stop_lon":"77.16124"},{"stop_id":"40","stop_code":"","stop_name":"Adarsh Nagar","stop_desc":"","stop_lat":"28.696377","stop_lon":"77.208809"},{"stop_id":"41","stop_code":"","stop_name":"Azadpur","stop_desc":"","stop_lat":"28.707287","stop_lon":"77.179863"},{"stop_id":"42","stop_code":"","stop_name":"Model Town","stop_desc":"","stop_lat":"28.702833","stop_lon":"77.193764"},{"stop_id":"43","stop_code":"","stop_name":"Guru Tegh Bahadur Nagar","stop_desc":"","stop_lat":"28.698195","stop_lon":"77.206985"},{"stop_id":"44","stop_code":"","stop_name":"Vishwavidyalaya","stop_desc":"","stop_lat":"28.694765","stop_lon":"77.212418"},{"stop_id":"45","stop_code":"","stop_name":"Vidhan Sabha","stop_desc":"","stop_lat":"28.687845","stop_lon":"77.221626"},{"stop_id":"46","stop_code":"","stop_name":"Civil Lines","stop_desc":"","stop_lat":"28.676945","stop_lon":"77.224953"},{"stop_id":"47","stop_code":"","stop_name":"Chandni Chowk","stop_desc":"","stop_lat":"28.656443","stop_lon":"77.229218"},{"stop_id":"48","stop_code":"","stop_name":"Chawri Bazar","stop_desc":"","stop_lat":"28.649635","stop_lon":"77.22628"},{"stop_id":"49","stop_code":"","stop_name":"New Delhi","stop_desc":"","stop_lat":"28.642944","stop_lon":"77.222351"},{"stop_id":"50","stop_code":"","stop_name":"Rajiv Chowk","stop_desc":"","stop_lat":"28.632896","stop_lon":"77.219574"},{"stop_id":"51","stop_code":"","stop_name":"Patel Chowk","stop_desc":"","stop_lat":"28.622967","stop_lon":"77.212288"},{"stop_id":"52","stop_code":"","stop_name":"Central Secretariat","stop_desc":"","stop_lat":"28.614973","stop_lon":"77.212029"},{"stop_id":"53","stop_code":"","stop_name":"Udyog Bhawan","stop_desc":"","stop_lat":"28.611525","stop_lon":"77.210052"},{"stop_id":"54","stop_code":"","stop_name":"Lok Kalyan Marg","stop_desc":"","stop_lat":"28.597519","stop_lon":"77.209122"},{"stop_id":"55","stop_code":"","stop_name":"Jorbagh","stop_desc":"","stop_lat":"28.587234","stop_lon":"77.212662"},{"stop_id":"56","stop_code":"","stop_name":"Dilli Haat - INA","stop_desc":"","stop_lat":"28.575195","stop_lon":"77.209473"},{"stop_id":"57","stop_code":"","stop_name":"AIIMS","stop_desc":"","stop_lat":"28.568199","stop_lon":"77.207947"},{"stop_id":"58","stop_code":"","stop_name":"Green Park","stop_desc":"","stop_lat":"28.559853","stop_lon":"77.206902"},{"stop_id":"59","stop_code":"","stop_name":"Hauz Khas","stop_desc":"","stop_lat":"28.543346","stop_lon":"77.206673"},{"stop_id":"60","stop_code":"","stop_name":"Malviya Nagar","stop_desc":"","stop_lat":"28.52817","stop_lon":"77.205612"},{"stop_id":"61","stop_code":"","stop_name":"Saket","stop_desc":"","stop_lat":"28.520638","stop_lon":"77.199379"},{"stop_id":"62","stop_code":"","stop_name":"Qutab Minar","stop_desc":"","stop_lat":"28.512714","stop_lon":"77.185791"},{"stop_id":"63","stop_code":"","stop_name":"Chhattarpur","stop_desc":"","stop_lat":"28.506584","stop_lon":"77.174866"},{"stop_id":"64","stop_code":"","stop_name":"Sultanpur","stop_desc":"","stop_lat":"28.499214","stop_lon":"77.161362"},{"stop_id":"65","stop_code":"","stop_name":"Ghitorni","stop_desc":"","stop_lat":"28.49383","stop_lon":"77.149071"},{"stop_id":"66","stop_code":"","stop_name":"Arjan Garh","stop_desc":"","stop_lat":"28.48082","stop_lon":"77.12587"},{"stop_id":"67","stop_code":"","stop_name":"Gurudronacharya","stop_desc":"","stop_lat":"28.482075","stop_lon":"77.102219"},{"stop_id":"68","stop_code":"","stop_name":"Sikanderpur","stop_desc":"","stop_lat":"28.481352","stop_lon":"77.092995"},{"stop_id":"69","stop_code":"","stop_name":"MG Road","stop_desc":"","stop_lat":"28.47967","stop_lon":"77.080444"},{"stop_id":"70","stop_code":"","stop_name":"IFFCO Chowk","stop_desc":"","stop_lat":"28.472137","stop_lon":"77.072502"},{"stop_id":"71","stop_code":"","stop_name":"Huda City Centre","stop_desc":"","stop_lat":"28.459118","stop_lon":"77.072586"},{"stop_id":"72","stop_code":"","stop_name":"Vaishali","stop_desc":"","stop_lat":"28.650059","stop_lon":"77.337608"},{"stop_id":"73","stop_code":"","stop_name":"Kaushambi","stop_desc":"","stop_lat":"28.645428","stop_lon":"77.322273"},{"stop_id":"74","stop_code":"","stop_name":"Anand Vihar","stop_desc":"","stop_lat":"28.647005","stop_lon":"77.316185"},{"stop_id":"75","stop_code":"","stop_name":"Karkarduma","stop_desc":"","stop_lat":"28.648653","stop_lon":"77.304581"},{"stop_id":"76","stop_code":"","stop_name":"Preet Vihar","stop_desc":"","stop_lat":"28.641352","stop_lon":"77.295158"},{"stop_id":"77","stop_code":"","stop_name":"Nirman Vihar","stop_desc":"","stop_lat":"28.637049","stop_lon":"77.287872"},{"stop_id":"78","stop_code":"","stop_name":"Laxmi Nagar","stop_desc":"","stop_lat":"28.629843","stop_lon":"77.276428"},{"stop_id":"79","stop_code":"","stop_name":"Noida City Centre","stop_desc":"","stop_lat":"28.574593","stop_lon":"77.356117"},{"stop_id":"80","stop_code":"","stop_name":"Golf Course","stop_desc":"","stop_lat":"28.566917","stop_lon":"77.345726"},{"stop_id":"81","stop_code":"","stop_name":"Botanical Garden","stop_desc":"","stop_lat":"28.564198","stop_lon":"77.334656"},{"stop_id":"82","stop_code":"","stop_name":"Noida Sec -18","stop_desc":"","stop_lat":"28.570843","stop_lon":"77.326088"},{"stop_id":"83","stop_code":"","stop_name":"Noida Sec -16","stop_desc":"","stop_lat":"28.577921","stop_lon":"77.318115"},{"stop_id":"84","stop_code":"","stop_name":"Noida Sec -15","stop_desc":"","stop_lat":"28.585018","stop_lon":"77.311584"},{"stop_id":"85","stop_code":"","stop_name":"New Ashok Nagar","stop_desc":"","stop_lat":"28.58847","stop_lon":"77.30146"},{"stop_id":"86","stop_code":"","stop_name":"Mayur Vihar Ext","stop_desc":"","stop_lat":"28.594124","stop_lon":"77.294495"},{"stop_id":"87","stop_code":"","stop_name":"Mayur Vihar-I","stop_desc":"","stop_lat":"28.604425","stop_lon":"77.289421"},{"stop_id":"88","stop_code":"","stop_name":"Akshardham","stop_desc":"","stop_lat":"28.618364","stop_lon":"77.279816"},{"stop_id":"89","stop_code":"","stop_name":"Yamuna Bank","stop_desc":"","stop_lat":"28.623178","stop_lon":"77.267937"},{"stop_id":"90","stop_code":"","stop_name":"Indraprastha","stop_desc":"","stop_lat":"28.620272","stop_lon":"77.250076"},{"stop_id":"91","stop_code":"","stop_name":"Supreme Court","stop_desc":"","stop_lat":"28.623438","stop_lon":"77.2425"},{"stop_id":"92","stop_code":"","stop_name":"Mandi House","stop_desc":"","stop_lat":"28.625816","stop_lon":"77.234726"},{"stop_id":"93","stop_code":"","stop_name":"Barakhamba","stop_desc":"","stop_lat":"28.629662","stop_lon":"77.224876"},{"stop_id":"94","stop_code":"","stop_name":"RK Ashram Marg","stop_desc":"","stop_lat":"28.639217","stop_lon":"77.206291"},{"stop_id":"95","stop_code":"","stop_name":"Jhandewalan","stop_desc":"","stop_lat":"28.644312","stop_lon":"77.199791"},{"stop_id":"96","stop_code":"","stop_name":"Karol Bagh","stop_desc":"","stop_lat":"28.643925","stop_lon":"77.188416"},{"stop_id":"97","stop_code":"","stop_name":"Rajendra Place","stop_desc":"","stop_lat":"28.64241","stop_lon":"77.191833"},{"stop_id":"98","stop_code":"","stop_name":"Patel Nagar","stop_desc":"","stop_lat":"28.645037","stop_lon":"77.167046"},{"stop_id":"99","stop_code":"","stop_name":"Shadipur","stop_desc":"","stop_lat":"28.65143","stop_lon":"77.156021"},{"stop_id":"100","stop_code":"","stop_name":"Kirti Nagar","stop_desc":"","stop_lat":"28.655773","stop_lon":"77.148499"},{"stop_id":"101","stop_code":"","stop_name":"Moti Nagar","stop_desc":"","stop_lat":"28.657803","stop_lon":"77.140488"},{"stop_id":"102","stop_code":"","stop_name":"Ramesh Nagar","stop_desc":"","stop_lat":"28.652809","stop_lon":"77.131462"},{"stop_id":"103","stop_code":"","stop_name":"Rajouri Garden","stop_desc":"","stop_lat":"28.649157","stop_lon":"77.122749"},{"stop_id":"104","stop_code":"","stop_name":"Tagore Garden","stop_desc":"","stop_lat":"28.643795","stop_lon":"77.112747"},{"stop_id":"105","stop_code":"","stop_name":"Subash Nagar","stop_desc":"","stop_lat":"28.640381","stop_lon":"77.10273"},{"stop_id":"106","stop_code":"","stop_name":"Tilak Nagar","stop_desc":"","stop_lat":"28.636568","stop_lon":"77.096336"},{"stop_id":"107","stop_code":"","stop_name":"Janak Puri East","stop_desc":"","stop_lat":"28.633121","stop_lon":"77.086578"},{"stop_id":"108","stop_code":"","stop_name":"Janak Puri West","stop_desc":"","stop_lat":"28.629637","stop_lon":"77.077866"},{"stop_id":"109","stop_code":"","stop_name":"Uttam Nagar East","stop_desc":"","stop_lat":"28.624643","stop_lon":"77.063126"},{"stop_id":"110","stop_code":"","stop_name":"Uttam Nagar West","stop_desc":"","stop_lat":"28.621672","stop_lon":"77.055664"},{"stop_id":"111","stop_code":"","stop_name":"Nawada","stop_desc":"","stop_lat":"28.620222","stop_lon":"77.044991"},{"stop_id":"112","stop_code":"","stop_name":"Dwarka Mor","stop_desc":"","stop_lat":"28.619366","stop_lon":"77.033188"},{"stop_id":"113","stop_code":"","stop_name":"Dwarka","stop_desc":"","stop_lat":"28.614899","stop_lon":"77.022629"},{"stop_id":"114","stop_code":"","stop_name":"Dwarka Sector - 14","stop_desc":"","stop_lat":"28.602232","stop_lon":"77.02594"},{"stop_id":"115","stop_code":"","stop_name":"Dwarka Sector - 13","stop_desc":"","stop_lat":"28.59705","stop_lon":"77.033043"},{"stop_id":"116","stop_code":"","stop_name":"Dwarka Sector - 12","stop_desc":"","stop_lat":"28.592234","stop_lon":"77.040558"},{"stop_id":"117","stop_code":"","stop_name":"Dwarka Sector - 11","stop_desc":"","stop_lat":"28.58642","stop_lon":"77.049255"},{"stop_id":"118","stop_code":"","stop_name":"Dwarka Sector - 10","stop_desc":"","stop_lat":"28.581108","stop_lon":"77.05719"},{"stop_id":"119","stop_code":"","stop_name":"Dwarka Sector - 9","stop_desc":"","stop_lat":"28.574284","stop_lon":"77.065086"},{"stop_id":"120","stop_code":"","stop_name":"Dwarka Sector - 8","stop_desc":"","stop_lat":"28.565706","stop_lon":"77.064896"},{"stop_id":"121","stop_code":"","stop_name":"Dwarka Sector - 21","stop_desc":"","stop_lat":"28.552322","stop_lon":"77.056198"},{"stop_id":"122","stop_code":"","stop_name":"ITO","stop_desc":"","stop_lat":"28.627205","stop_lon":"77.240952"},{"stop_id":"123","stop_code":"","stop_name":"Janpath","stop_desc":"","stop_lat":"28.627817","stop_lon":"77.218956"},{"stop_id":"124","stop_code":"","stop_name":"Khan Market","stop_desc":"","stop_lat":"28.602682","stop_lon":"77.228096"},{"stop_id":"125","stop_code":"","stop_name":"Jawahar Lal Nehru Stadium","stop_desc":"","stop_lat":"28.590475","stop_lon":"77.23307"},{"stop_id":"126","stop_code":"","stop_name":"Jangpura","stop_desc":"","stop_lat":"28.583231","stop_lon":"77.239662"},{"stop_id":"127","stop_code":"","stop_name":"Lajpat Nagar","stop_desc":"","stop_lat":"28.570705","stop_lon":"77.233124"},{"stop_id":"128","stop_code":"","stop_name":"Moolchand","stop_desc":"","stop_lat":"28.564629","stop_lon":"77.234222"},{"stop_id":"129","stop_code":"","stop_name":"Kailash Colony","stop_desc":"","stop_lat":"28.554617","stop_lon":"77.239738"},{"stop_id":"130","stop_code":"","stop_name":"Nehru Place","stop_desc":"","stop_lat":"28.551134","stop_lon":"77.251511"},{"stop_id":"131","stop_code":"","stop_name":"Kalkaji Mandir","stop_desc":"","stop_lat":"28.549532","stop_lon":"77.258789"},{"stop_id":"132","stop_code":"","stop_name":"Govind Puri","stop_desc":"","stop_lat":"28.544413","stop_lon":"77.264259"},{"stop_id":"133","stop_code":"","stop_name":"Harkesh Nagar Okhla","stop_desc":"","stop_lat":"28.543194","stop_lon":"77.275955"},{"stop_id":"134","stop_code":"","stop_name":"Jasola-Apollo","stop_desc":"","stop_lat":"28.538084","stop_lon":"77.285538"},{"stop_id":"135","stop_code":"","stop_name":"Sarita Vihar","stop_desc":"","stop_lat":"28.528622","stop_lon":"77.288345"},{"stop_id":"136","stop_code":"","stop_name":"Mohan Estate","stop_desc":"","stop_lat":"28.51959","stop_lon":"77.294518"},{"stop_id":"137","stop_code":"","stop_name":"Tughlakabad Station","stop_desc":"","stop_lat":"28.502232","stop_lon":"77.29866"},{"stop_id":"138","stop_code":"","stop_name":"Badarpur Border","stop_desc":"","stop_lat":"28.4932","stop_lon":"77.30085"},{"stop_id":"139","stop_code":"","stop_name":"Sarai","stop_desc":"","stop_lat":"28.47794","stop_lon":"77.304932"},{"stop_id":"140","stop_code":"","stop_name":"NHPC Chowk","stop_desc":"","stop_lat":"28.462435","stop_lon":"77.305252"},{"stop_id":"141","stop_code":"","stop_name":"Mewala Maharajpur","stop_desc":"","stop_lat":"28.4485","stop_lon":"77.308098"},{"stop_id":"142","stop_code":"","stop_name":"Sector-28","stop_desc":"","stop_lat":"28.440586","stop_lon":"77.305992"},{"stop_id":"143","stop_code":"","stop_name":"Badkal Mor","stop_desc":"","stop_lat":"28.422707","stop_lon":"77.310234"},{"stop_id":"144","stop_code":"","stop_name":"Old Faridabad","stop_desc":"","stop_lat":"28.412172","stop_lon":"77.311272"},{"stop_id":"145","stop_code":"","stop_name":"Neelam Chowk Ajronda","stop_desc":"","stop_lat":"28.400707","stop_lon":"77.309105"},{"stop_id":"146","stop_code":"","stop_name":"Bata Chowk","stop_desc":"","stop_lat":"28.386362","stop_lon":"77.298782"},{"stop_id":"147","stop_code":"","stop_name":"Escorts Mujesar","stop_desc":"","stop_lat":"28.370199","stop_lon":"77.315002"},{"stop_id":"148","stop_code":"","stop_name":"Sikanderpur (Rapid Metro)","stop_desc":"","stop_lat":"28.480833","stop_lon":"77.094246"},{"stop_id":"149","stop_code":"","stop_name":"Phase 2 (Rapid Metro)","stop_desc":"","stop_lat":"28.488371","stop_lon":"77.092865"},{"stop_id":"150","stop_code":"","stop_name":"Belvedere Towers (Rapid Metro)","stop_desc":"","stop_lat":"28.492065","stop_lon":"77.088142"},{"stop_id":"151","stop_code":"","stop_name":"Cyber City (Rapid Metro)","stop_desc":"","stop_lat":"28.498478","stop_lon":"77.089088"},{"stop_id":"152","stop_code":"","stop_name":"Moulsari Avenue (Rapid Metro)","stop_desc":"","stop_lat":"28.501572","stop_lon":"77.094536"},{"stop_id":"153","stop_code":"","stop_name":"Phase 3 (Rapid Metro)","stop_desc":"","stop_lat":"28.494329","stop_lon":"77.093552"},{"stop_id":"154","stop_code":"","stop_name":"IGI Airport","stop_desc":"","stop_lat":"28.554869","stop_lon":"77.087921"},{"stop_id":"155","stop_code":"","stop_name":"Delhi Aerocity","stop_desc":"","stop_lat":"28.548792","stop_lon":"77.120743"},{"stop_id":"156","stop_code":"","stop_name":"Dhaula Kuan","stop_desc":"","stop_lat":"28.591776","stop_lon":"77.161545"},{"stop_id":"157","stop_code":"","stop_name":"Shivaji Stadium","stop_desc":"","stop_lat":"28.629007","stop_lon":"77.209213"},{"stop_id":"158","stop_code":"","stop_name":"Delhi Gate","stop_desc":"","stop_lat":"28.640488","stop_lon":"77.240303"},{"stop_id":"159","stop_code":"","stop_name":"Jama Masjid","stop_desc":"","stop_lat":"28.650393","stop_lon":"77.237556"},{"stop_id":"160","stop_code":"","stop_name":"Lal Quila","stop_desc":"","stop_lat":"28.657576","stop_lon":"77.236595"},{"stop_id":"161","stop_code":"","stop_name":"Okhla Bird Sanctuary","stop_desc":"","stop_lat":"28.552816","stop_lon":"77.321564"},{"stop_id":"162","stop_code":"","stop_name":"Kalindi Kunj","stop_desc":"","stop_lat":"28.542835","stop_lon":"77.310173"},{"stop_id":"163","stop_code":"","stop_name":"Jasola Vihar Shaheen Bagh","stop_desc":"","stop_lat":"28.546005","stop_lon":"77.296715"},{"stop_id":"164","stop_code":"","stop_name":"Okhla Vihar","stop_desc":"","stop_lat":"28.561255","stop_lon":"77.291916"},{"stop_id":"165","stop_code":"","stop_name":"Jamia Millia Islamia","stop_desc":"","stop_lat":"28.562944","stop_lon":"77.286209"},{"stop_id":"166","stop_code":"","stop_name":"Sukhdev Vihar","stop_desc":"","stop_lat":"28.559887","stop_lon":"77.275116"},{"stop_id":"167","stop_code":"","stop_name":"Okhla NSIC","stop_desc":"","stop_lat":"28.554575","stop_lon":"77.26487"},{"stop_id":"168","stop_code":"","stop_name":"Phase-I (Rapid Metro)","stop_desc":"","stop_lat":"28.471981","stop_lon":"77.094009"},{"stop_id":"169","stop_code":"","stop_name":"Sector 42-43 (Rapid Metro)","stop_desc":"","stop_lat":"28.458475","stop_lon":"77.09684"},{"stop_id":"170","stop_code":"","stop_name":"Sector 53-54 (Rapid Metro)","stop_desc":"","stop_lat":"28.447533","stop_lon":"77.100487"},{"stop_id":"171","stop_code":"","stop_name":"Sector 54 Chowk (Rapid Metro)","stop_desc":"","stop_lat":"28.434212","stop_lon":"77.104782"},{"stop_id":"172","stop_code":"","stop_name":"Sector 55-56 (Rapid Metro)","stop_desc":"","stop_lat":"28.424587","stop_lon":"77.105042"},{"stop_id":"173","stop_code":"","stop_name":"Majlis Park","stop_desc":"","stop_lat":"28.724157","stop_lon":"77.182068"},{"stop_id":"174","stop_code":"","stop_name":"Shalimar Bagh","stop_desc":"","stop_lat":"28.70182","stop_lon":"77.165184"},{"stop_id":"175","stop_code":"","stop_name":"Shakurpur","stop_desc":"","stop_lat":"28.685781","stop_lon":"77.149651"},{"stop_id":"176","stop_code":"","stop_name":"Punjabi Bagh West","stop_desc":"","stop_lat":"28.672747","stop_lon":"77.139183"},{"stop_id":"177","stop_code":"","stop_name":"ESI Basai Darapur","stop_desc":"","stop_lat":"28.658159","stop_lon":"77.127319"},{"stop_id":"178","stop_code":"","stop_name":"Mayapuri","stop_desc":"","stop_lat":"28.637098","stop_lon":"77.129738"},{"stop_id":"179","stop_code":"","stop_name":"Naraina Vihar","stop_desc":"","stop_lat":"28.624121","stop_lon":"77.136482"},{"stop_id":"180","stop_code":"","stop_name":"Delhi Cantt.","stop_desc":"","stop_lat":"28.608641","stop_lon":"77.140373"},{"stop_id":"181","stop_code":"","stop_name":"Durgabai Deshmukh South Campus","stop_desc":"","stop_lat":"28.589376","stop_lon":"77.169518"},{"stop_id":"182","stop_code":"","stop_name":"Nehru Enclave","stop_desc":"","stop_lat":"28.545856","stop_lon":"77.25116"},{"stop_id":"183","stop_code":"","stop_name":"Greater Kailash","stop_desc":"","stop_lat":"28.541836","stop_lon":"77.238243"},{"stop_id":"184","stop_code":"","stop_name":"Chirag Delhi","stop_desc":"","stop_lat":"28.541229","stop_lon":"77.229385"},{"stop_id":"185","stop_code":"","stop_name":"Panchsheel Park","stop_desc":"","stop_lat":"28.542339","stop_lon":"77.220512"},{"stop_id":"186","stop_code":"","stop_name":"IIT","stop_desc":"","stop_lat":"28.547194","stop_lon":"77.193832"},{"stop_id":"187","stop_code":"","stop_name":"RK Puram","stop_desc":"","stop_lat":"28.550486","stop_lon":"77.184952"},{"stop_id":"188","stop_code":"","stop_name":"Munirka","stop_desc":"","stop_lat":"28.557821","stop_lon":"77.174026"},{"stop_id":"189","stop_code":"","stop_name":"Vasant Vihar","stop_desc":"","stop_lat":"28.558378","stop_lon":"77.160774"},{"stop_id":"190","stop_code":"","stop_name":"Shankar Vihar","stop_desc":"","stop_lat":"28.560787","stop_lon":"77.140442"},{"stop_id":"191","stop_code":"","stop_name":"Terminal 1- IGI Airport","stop_desc":"","stop_lat":"28.565275","stop_lon":"77.122391"},{"stop_id":"192","stop_code":"","stop_name":"Sadar Bazar Contonment","stop_desc":"","stop_lat":"28.577108","stop_lon":"77.111305"},{"stop_id":"193","stop_code":"","stop_name":"Palam","stop_desc":"","stop_lat":"28.589067","stop_lon":"77.082954"},{"stop_id":"194","stop_code":"","stop_name":"Dashrath Puri","stop_desc":"","stop_lat":"28.602333","stop_lon":"77.08255"},{"stop_id":"195","stop_code":"","stop_name":"Dabri Mor - Janakpuri South","stop_desc":"","stop_lat":"28.615904","stop_lon":"77.085258"},{"stop_id":"196","stop_code":"","stop_name":"Mundka Industrial Area (M.I.A)","stop_desc":"","stop_lat":"28.68396","stop_lon":"76.989822"},{"stop_id":"197","stop_code":"","stop_name":"Ghevra Metro station","stop_desc":"","stop_lat":"28.685289","stop_lon":"76.993584"},{"stop_id":"198","stop_code":"","stop_name":"Tikri Kalan","stop_desc":"","stop_lat":"28.686899","stop_lon":"76.977249"},{"stop_id":"199","stop_code":"","stop_name":"Tikri Border","stop_desc":"","stop_lat":"28.687876","stop_lon":"76.963783"},{"stop_id":"200","stop_code":"","stop_name":"Pandit Shree Ram Sharma","stop_desc":"","stop_lat":"28.689213","stop_lon":"76.951088"},{"stop_id":"201","stop_code":"","stop_name":"Bahadurgarh City","stop_desc":"","stop_lat":"28.690784","stop_lon":"76.935265"},{"stop_id":"202","stop_code":"","stop_name":"Brigadier Hoshiyar Singh","stop_desc":"","stop_lat":"28.697428","stop_lon":"76.919128"},{"stop_id":"203","stop_code":"","stop_name":"Sir Vishweshwaraiah Moti Bagh","stop_desc":"","stop_lat":"28.578529","stop_lon":"77.175713"},{"stop_id":"204","stop_code":"","stop_name":"Bhikaji Cama Place","stop_desc":"","stop_lat":"28.570208","stop_lon":"77.187866"},{"stop_id":"205","stop_code":"","stop_name":"Sarojini Nagar","stop_desc":"","stop_lat":"28.570208","stop_lon":"77.187866"},{"stop_id":"206","stop_code":"","stop_name":"South Extension","stop_desc":"","stop_lat":"28.5686","stop_lon":"77.219818"},{"stop_id":"207","stop_code":"","stop_name":"Trilokpuri Sanjay Lake","stop_desc":"","stop_lat":"28.613506","stop_lon":"77.308678"},{"stop_id":"208","stop_code":"","stop_name":"East Vinod Nagar - Mayur Vihar-II","stop_desc":"","stop_lat":"28.620052","stop_lon":"77.305588"},{"stop_id":"209","stop_code":"","stop_name":"Mandawali - West Vinod Nagar","stop_desc":"","stop_lat":"28.624861","stop_lon":"77.304146"},{"stop_id":"210","stop_code":"","stop_name":"IP Extension","stop_desc":"","stop_lat":"28.631599","stop_lon":"77.310898"},{"stop_id":"211","stop_code":"","stop_name":"Karkarduma Court","stop_desc":"","stop_lat":"28.649473","stop_lon":"77.295341"},{"stop_id":"212","stop_code":"","stop_name":"Krishna Nagar","stop_desc":"","stop_lat":"28.65782","stop_lon":"77.290306"},{"stop_id":"213","stop_code":"","stop_name":"East Azad Nagar","stop_desc":"","stop_lat":"28.665043","stop_lon":"77.284599"},{"stop_id":"214","stop_code":"","stop_name":"Jafrabad","stop_desc":"","stop_lat":"28.682943","stop_lon":"77.27507"},{"stop_id":"215","stop_code":"","stop_name":"Maujpur - Babarpur","stop_desc":"","stop_lat":"28.692057","stop_lon":"77.280922"},{"stop_id":"216","stop_code":"","stop_name":"Gokulpuri","stop_desc":"","stop_lat":"28.703009","stop_lon":"77.286301"},{"stop_id":"217","stop_code":"","stop_name":"Johri Enclave","stop_desc":"","stop_lat":"28.713297","stop_lon":"77.290154"},{"stop_id":"218","stop_code":"","stop_name":"Shiv Vihar","stop_desc":"","stop_lat":"28.721863","stop_lon":"77.289635"},{"stop_id":"219","stop_code":"","stop_name":"Sant Surdas (Sihi)","stop_desc":"","stop_lat":"28.354666","stop_lon":"77.316261"},{"stop_id":"220","stop_code":"","stop_name":"Raja Nahar Singh","stop_desc":"","stop_lat":"28.339899","stop_lon":"77.331657"},{"stop_id":"221","stop_code":"","stop_name":"Vinobapuri","stop_desc":"","stop_lat":"28.566179","stop_lon":"77.249367"},{"stop_id":"222","stop_code":"","stop_name":"Ashram","stop_desc":"","stop_lat":"28.576065","stop_lon":"77.25753"},{"stop_id":"223","stop_code":"","stop_name":"Sarai Kale Khan - Nizamuddin","stop_desc":"","stop_lat":"28.5889","stop_lon":"77.253189"},{"stop_id":"224","stop_code":"","stop_name":"Mayur Vihar Pocket 1","stop_desc":"","stop_lat":"28.606598","stop_lon":"77.296326"},{"stop_id":"225","stop_code":"","stop_name":"Shaheed Sthal (New Bus Adda)","stop_desc":"","stop_lat":"28.670177","stop_lon":"77.416031"},{"stop_id":"226","stop_code":"","stop_name":"Hindon River","stop_desc":"","stop_lat":"28.673508","stop_lon":"77.40654"},{"stop_id":"227","stop_code":"","stop_name":"Arthala","stop_desc":"","stop_lat":"28.6772","stop_lon":"77.391876"},{"stop_id":"228","stop_code":"","stop_name":"Mohan Nagar","stop_desc":"","stop_lat":"28.67856","stop_lon":"77.384209"},{"stop_id":"229","stop_code":"","stop_name":"Shyam Park","stop_desc":"","stop_lat":"28.678217","stop_lon":"77.370911"},{"stop_id":"230","stop_code":"","stop_name":"Major Mohit Sharma Rajender Nagar","stop_desc":"","stop_lat":"28.678095","stop_lon":"77.359528"},{"stop_id":"231","stop_code":"","stop_name":"Raj Bagh","stop_desc":"","stop_lat":"28.677122","stop_lon":"77.346466"},{"stop_id":"232","stop_code":"","stop_name":"Shaheed Nagar","stop_desc":"","stop_lat":"28.676615","stop_lon":"77.333809"},{"stop_id":"233","stop_code":"","stop_name":"Noida Sec-34","stop_desc":"","stop_lat":"28.580229","stop_lon":"77.363518"},{"stop_id":"234","stop_code":"","stop_name":"Noida Sec-52","stop_desc":"","stop_lat":"28.586849","stop_lon":"77.372749"},{"stop_id":"235","stop_code":"","stop_name":"Noida Sec-61","stop_desc":"","stop_lat":"28.597677","stop_lon":"77.372368"},{"stop_id":"236","stop_code":"","stop_name":"Noida Sec-59","stop_desc":"","stop_lat":"28.609089","stop_lon":"77.372955"},{"stop_id":"237","stop_code":"","stop_name":"Noida Sec-62","stop_desc":"","stop_lat":"28.616991","stop_lon":"77.373611"},{"stop_id":"238","stop_code":"","stop_name":"Noida Electronic City","stop_desc":"","stop_lat":"28.628685","stop_lon":"77.375229"},{"stop_id":"239","stop_code":"","stop_name":"Nangli","stop_desc":"","stop_lat":"28.61722","stop_lon":"77.010345"},{"stop_id":"240","stop_code":"","stop_name":"Najafgarh","stop_desc":"","stop_lat":"28.613316","stop_lon":"76.986259"},{"stop_id":"241","stop_code":"","stop_name":"Dhansa Bus Stand","stop_desc":"","stop_lat":"28.611858","stop_lon":"76.975426"},{"stop_id":"500","stop_code":"","stop_name":"Noida Sector 51","stop_desc":"","stop_lat":"28.585548","stop_lon":"77.375374"},{"stop_id":"501","stop_code":"","stop_name":"Noida Sector 50","stop_desc":"","stop_lat":"28.574547","stop_lon":"77.378357"},{"stop_id":"502","stop_code":"","stop_name":"Noida Sector 76","stop_desc":"","stop_lat":"28.565445","stop_lon":"77.37973"},{"stop_id":"503","stop_code":"","stop_name":"Noida Sector 101","stop_desc":"","stop_lat":"28.556065","stop_lon":"77.385056"},{"stop_id":"504","stop_code":"","stop_name":"Noida Sector 81","stop_desc":"","stop_lat":"28.549259","stop_lon":"77.390099"},{"stop_id":"505","stop_code":"","stop_name":"NSEZ","stop_desc":"","stop_lat":"28.532248","stop_lon":"77.394951"},{"stop_id":"506","stop_code":"","stop_name":"Noida Sector 83","stop_desc":"","stop_lat":"28.522284","stop_lon":"77.396477"},{"stop_id":"507","stop_code":"","stop_name":"Noida Sector 137","stop_desc":"","stop_lat":"28.510817","stop_lon":"77.403625"},{"stop_id":"508","stop_code":"","stop_name":"Noida Sector 142","stop_desc":"","stop_lat":"28.498999","stop_lon":"77.412567"},{"stop_id":"509","stop_code":"","stop_name":"Noida Sector 143","stop_desc":"","stop_lat":"28.494246","stop_lon":"77.422318"},{"stop_id":"510","stop_code":"","stop_name":"Noida Sector 144","stop_desc":"","stop_lat":"28.486376","stop_lon":"77.432968"},{"stop_id":"511","stop_code":"","stop_name":"Noida Sector 145","stop_desc":"","stop_lat":"28.47913","stop_lon":"77.442307"},{"stop_id":"512","stop_code":"","stop_name":"Noida Sector 146","stop_desc":"","stop_lat":"28.468822","stop_lon":"77.455101"},{"stop_id":"513","stop_code":"","stop_name":"Noida Sector 147","stop_desc":"","stop_lat":"28.4594","stop_lon":"77.465965"},{"stop_id":"514","stop_code":"","stop_name":"Noida Sector 148","stop_desc":"","stop_lat":"28.448021","stop_lon":"77.476692"},{"stop_id":"515","stop_code":"","stop_name":"Knowledge Park","stop_desc":"","stop_lat":"28.456865","stop_lon":"77.500298"},{"stop_id":"516","stop_code":"","stop_name":"Pari Chowk","stop_desc":"","stop_lat":"28.463331","stop_lon":"77.508308"},{"stop_id":"517","stop_code":"","stop_name":"Alpha 1","stop_desc":"","stop_lat":"28.470879","stop_lon":"77.512718"},{"stop_id":"518","stop_code":"","stop_name":"Delta 1","stop_desc":"","stop_lat":"28.478374","stop_lon":"77.525581"},{"stop_id":"519","stop_code":"","stop_name":"GNIDA Office","stop_desc":"","stop_lat":"28.484531","stop_lon":"77.536621"},{"stop_id":"520","stop_code":"","stop_name":"Depot Station","stop_desc":"","stop_lat":"28.488651","stop_lon":"77.544075"}]');
  routeList.clear();
  Constants.latitudeHashmap.clear();
  Constants.longitudeHashmap.clear();
  for(int i=0;i<o.length;i++){
    routeList.add(o[i]["stop_name"]);
    Constants.latitudeHashmap[o[i]["stop_name"]]=o[i]["stop_lat"];
    Constants.longitudeHashmap[o[i]["stop_name"]]=o[i]["stop_lat"];
    debugPrint("${o[i]["stop_name"]}");
  }
}

getLatLog()async{
  if(sourceController.text.isEmpty){
MyToast.toast("Please start location");
  }else if(destinationController.text.isEmpty){
    MyToast.toast("Please End location");
  }else{

    var sourceLat=await Constants.latitudeHashmap[sourceController.text];
    var sourceLog=await Constants.longitudeHashmap[sourceController.text];
    var destiLat=await Constants.latitudeHashmap[destinationController.text];
    var destiLog=await Constants.longitudeHashmap[destinationController.text];
    debugPrint("$sourceLog  :   $sourceLat   : $destiLog    :  $destiLat");
    Get.to(RouteLocatorScreen());
  }
}

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  @override
  void onClose() {
    super.onClose();
    inputFieldController.dispose();
    inputFieldOneController.dispose();
  }
}
