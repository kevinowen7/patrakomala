import 'dart:convert' as aConvert;
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:patrakomala_neumorphic/models/models.dart';

part 'map_services.dart';
part 'user_services.dart';

String baseURL = 'http://103.108.201.44:8080/api/';
