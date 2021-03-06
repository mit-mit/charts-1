// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import '../gallery_scaffold.dart';
import 'bar_secondary_axis.dart';
import 'bar_secondary_axis_only.dart';
import 'horizontal_bar_secondary_axis.dart';
import 'short_tick_length_axis.dart';
import 'custom_font_size_and_color.dart';
import 'measure_axis_label_alignment.dart';
import 'hidden_ticks_and_labels_axis.dart';
import 'custom_axis_tick_formatters.dart';
import 'custom_measure_tick_count.dart';
import 'integer_only_measure_axis.dart';
import 'nonzero_bound_measure_axis.dart';
import 'statically_provided_ticks.dart';

List<GalleryScaffold> buildGallery() {
  return [
    new GalleryScaffold(
      listTileIcon: new Icon(Icons.insert_chart),
      title: 'Bar chart with Secondary Measure Axis',
      subtitle: 'Bar chart with a series using a secondary measure axis',
      childBuilder: () => new BarChartWithSecondaryAxis.withRandomData(),
    ),
    new GalleryScaffold(
      listTileIcon: new Icon(Icons.insert_chart),
      title: 'Bar chart with Secondary Measure Axis only',
      subtitle: 'Bar chart with both series using secondary measure axis',
      childBuilder: () => new BarChartWithSecondaryAxisOnly.withRandomData(),
    ),
    new GalleryScaffold(
      listTileIcon: new Transform.rotate(
          angle: 1.5708, child: new Icon(Icons.insert_chart)),
      title: 'Horizontal bar chart with Secondary Measure Axis',
      subtitle:
          'Horizontal Bar chart with a series using secondary measure axis',
      childBuilder: () =>
          new HorizontalBarChartWithSecondaryAxis.withRandomData(),
    ),
    new GalleryScaffold(
      listTileIcon: new Icon(Icons.insert_chart),
      title: 'Short Ticks Axis',
      subtitle: 'Bar chart with the primary measure axis having short ticks',
      childBuilder: () => new ShortTickLengthAxis.withRandomData(),
    ),
    new GalleryScaffold(
      listTileIcon: new Icon(Icons.insert_chart),
      title: 'Custom Axis Fonts',
      subtitle: 'Bar chart with custom axis font size and color',
      childBuilder: () => new CustomFontSizeAndColor.withRandomData(),
    ),
    new GalleryScaffold(
      listTileIcon: new Icon(Icons.insert_chart),
      title: 'Label Alignment Axis',
      subtitle: 'Bar chart with custom measure axis label alignments',
      childBuilder: () => new MeasureAxisLabelAlignment.withRandomData(),
    ),
    new GalleryScaffold(
      listTileIcon: new Icon(Icons.insert_chart),
      title: 'No Axis',
      subtitle: 'Bar chart with only the axis line drawn',
      childBuilder: () => new HiddenTicksAndLabelsAxis.withRandomData(),
    ),
    new GalleryScaffold(
      listTileIcon: new Icon(Icons.insert_chart),
      title: 'Statically Provided Ticks',
      subtitle: 'Bar chart with statically provided ticks',
      childBuilder: () => new StaticallyProvidedTicks.withRandomData(),
    ),
    new GalleryScaffold(
      listTileIcon: new Icon(Icons.show_chart),
      title: 'Custom Formatter',
      subtitle: 'Timeseries with custom domain and measure tick formatters',
      childBuilder: () => new CustomAxisTickFormatters.withRandomData(),
    ),
    new GalleryScaffold(
      listTileIcon: new Icon(Icons.show_chart),
      title: 'Custom Tick Count',
      subtitle: 'Timeseries with custom measure axis tick count',
      childBuilder: () => new CustomMeasureTickCount.withRandomData(),
    ),
    new GalleryScaffold(
      listTileIcon: new Icon(Icons.show_chart),
      title: 'Integer Measure Ticks',
      subtitle: 'Timeseries with only whole number measure axis ticks',
      childBuilder: () => new IntegerOnlyMeasureAxis.withRandomData(),
    ),
    new GalleryScaffold(
      listTileIcon: new Icon(Icons.show_chart),
      title: 'Non-zero bound Axis',
      subtitle: 'Timeseries with measure axis that does not include zero',
      childBuilder: () => new NonzeroBoundMeasureAxis.withRandomData(),
    ),
  ];
}
