import 'package:flutter/material.dart';

class ProTrader {
  final String name;
  final String initials;
  final int followers;
  final String roi;
  final String totalPnl;
  final String winRate;
  final String aum;
  final List<double> chartData; 

  const ProTrader({
    required this.name,
    required this.initials,
    required this.followers,
    required this.roi,
    required this.totalPnl,
    required this.winRate,
    required this.aum,
    required this.chartData,
  });
}

final List<ProTrader> proTraders = [
  const ProTrader(
    name: 'Jay isisou',
    initials: 'JI',
    followers: 500,
    roi: '+120.42%',
    totalPnl: '\$38,667.29',
    winRate: '100%',
    aum: '38,667.29',
    chartData: [0.5, 0.6, 0.4, 0.8, 0.7, 0.9, 0.6],
  ),
  const ProTrader(
    name: 'Laura okobi',
    initials: 'LO',
    followers: 500,
    roi: '+120.42%',
    totalPnl: '\$38,667.29',
    winRate: '100%',
    aum: '38,667.29',
    chartData: [0.5, 0.6, 0.4, 0.8, 0.7, 0.9, 0.6],
  ),
  const ProTrader(
    name: 'BTC master',
    initials: 'BM',
    followers: 500,
    roi: '+120.42%',
    totalPnl: '\$38,667.29',
    winRate: '100%',
    aum: '38,667.29',
    chartData: [0.5, 0.6, 0.4, 0.8, 0.7, 0.9, 0.6],
  ),
];