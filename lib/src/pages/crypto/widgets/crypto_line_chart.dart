import 'package:crypto_app/src/models/crypto_chart_point_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CryptoLineChart extends StatelessWidget {
  const CryptoLineChart({
    super.key,
    required this.chartPoints,
  });

  final List<CryptoChartPointModel> chartPoints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
              show: true,
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 42,
                  interval: 400,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toStringAsFixed(0),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 50, // evita poluição visual
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              )),
          gridData: const FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 500,
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                chartPoints.length,
                (index) => FlSpot(
                  index.toDouble(),
                  chartPoints[index].price,
                ),
              ),
              isCurved: true,
              dotData: const FlDotData(show: false),
              barWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
