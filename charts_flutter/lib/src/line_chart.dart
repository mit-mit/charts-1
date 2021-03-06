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

import 'package:charts_common/common.dart' as common
    show LineChart, RTLSpec, Series, LineRendererConfig;
import 'behaviors/line_point_highlighter.dart' show LinePointHighlighter;
import 'behaviors/chart_behavior.dart' show ChartBehavior;
import 'base_chart.dart' show BaseChart, LayoutConfig;
import 'base_chart_state.dart' show BaseChartState;
import 'selection_model_config.dart' show SelectionModelConfig;

class LineChart<T> extends BaseChart<T, num> {
  LineChart(
    List<common.Series> seriesList, {
    bool animate,
    Duration animationDuration,
    common.LineRendererConfig defaultRenderer,
    List<ChartBehavior> behaviors,
    List<SelectionModelConfig> selectionModels,
    common.RTLSpec rtlSpec,
    LayoutConfig layoutConfig,
    bool defaultInteractions: true,
  }) : super(
          seriesList,
          animate: animate,
          animationDuration: animationDuration,
          defaultRenderer: defaultRenderer,
          behaviors: behaviors,
          selectionModels: selectionModels,
          rtlSpec: rtlSpec,
          layoutConfig: layoutConfig,
          defaultInteractions: defaultInteractions,
        );

  @override
  common.LineChart<T> createCommonChart(BaseChartState chartState) =>
      new common.LineChart<T>(layoutConfig: layoutConfig?.commonLayoutConfig);

  @override
  void addDefaultInteractions(List<ChartBehavior> behaviors) {
    super.addDefaultInteractions(behaviors);

    behaviors.add(new LinePointHighlighter());
  }
}
