part of 'about_pcc_bloc.dart';

abstract class AboutPccState extends Equatable {
  const AboutPccState();
  
}

class AboutPccInitial extends AboutPccState {
  
  @override
  List<Object> get props => [];
}

class AboutPccLoaded extends AboutPccState {
  final ApiReturnValue<List<AboutPcc>> aPcc;
  AboutPccLoaded(this.aPcc);
  @override
  List<Object> get props => [aPcc];
}
