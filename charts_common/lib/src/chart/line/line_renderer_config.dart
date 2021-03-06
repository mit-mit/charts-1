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

import '../../common/symbol_renderer.dart';
import '../layout/layout_view.dart' show LayoutViewConfig;
import '../common/series_renderer_config.dart'
    show RendererAttributes, SeriesRendererConfig;
import 'line_renderer.dart' show LineRenderer;

/// Configuration for a line renderer.
class LineRendererConfig extends LayoutViewConfig
    implements SeriesRendererConfig {
  final String customRendererId;

  final SymbolRenderer symbolRenderer;

  final rendererAttributes = new RendererAttributes();

  /// Stroke width of the line.
  final double strokeWidthPx;

  /// Dash pattern for the line.
  final List<int> dashPattern;

  LineRendererConfig(
      {this.customRendererId,
      this.strokeWidthPx = 2.0,
      this.dashPattern,
      this.symbolRenderer});

  @override
  LineRenderer build() {
    return new LineRenderer(config: this, rendererId: customRendererId);
  }
}
