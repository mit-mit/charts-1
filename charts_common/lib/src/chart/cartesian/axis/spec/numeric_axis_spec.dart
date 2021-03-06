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

import 'package:meta/meta.dart' show immutable;
import 'package:intl/intl.dart';

import '../../../common/chart_context.dart' show ChartContext;
import '../numeric_tick_provider.dart' show NumericTickProvider;
import '../static_tick_provider.dart' show StaticTickProvider;
import '../tick_formatter.dart' show NumericTickFormatter;
import '../numeric_extents.dart' show NumericExtents;
import '../numeric_scale.dart' show NumericScale;
import 'axis_spec.dart'
    show AxisSpec, TickProviderSpec, TickFormatterSpec, RenderSpec;
import 'tick_spec.dart' show TickSpec;

/// [AxisSpec] specialized for numeric/continuous axes like the measure axis.
@immutable
class NumericAxisSpec extends AxisSpec<num, NumericExtents, NumericScale> {
  /// Creates a [AxisSpec] that specialized for numeric data.
  ///
  /// [renderSpec] spec used to configure how the ticks and labels
  ///     actually render. Possible values are [GridlineRendererSpec],
  ///     [SmallTickRendererSpec] & [NoneRenderSpec]. Make sure that the <D>
  ///     given to the RenderSpec is of type [num] when using this spec.
  /// [tickProviderSpec] spec used to configure what ticks are generated.
  /// [tickFormatterSpec] spec used to configure how the tick labels are
  ///     formatted.
  /// [showAxisLine] override to force the axis to draw the axis line.
  NumericAxisSpec({
    RenderSpec<num> renderSpec,
    NumericTickProviderSpec tickProviderSpec,
    NumericTickFormatterSpec tickFormatterSpec,
    bool showAxisLine,
  }) : super(
            renderSpec: renderSpec,
            tickProviderSpec: tickProviderSpec,
            tickFormatterSpec: tickFormatterSpec,
            showAxisLine: showAxisLine);

  @override
  bool operator ==(Object other) =>
      other is NumericAxisSpec && super == (other);
}

abstract class NumericTickProviderSpec
    extends TickProviderSpec<num, NumericExtents, NumericScale> {}

abstract class NumericTickFormatterSpec extends TickFormatterSpec<num> {}

@immutable
class BasicNumericTickProviderSpec implements NumericTickProviderSpec {
  final bool zeroBound;
  final bool dataIsInWholeNumbers;
  final int desiredTickCount;
  final int desiredMinTickCount;
  final int desiredMaxTickCount;

  /// Creates a [TickProviderSpec] that dynamically chooses the number of
  /// ticks based on the extents of the data.
  ///
  /// [zeroBound] automatically include zero in the data range.
  /// [dataIsInWholeNumbers] skip over ticks that would produce
  ///     fractional ticks that don't make sense for the domain (ie: headcount).
  /// [desiredTickCount] the fixed number of ticks to try to make. Convenience
  ///     that sets [desiredMinTickCount] and [desiredMaxTickCount] the same.
  ///     Both min and max win out if they are set along with
  ///     [desiredTickCount].
  /// [desiredMinTickCount] automatically choose the best tick
  ///     count to produce the 'nicest' ticks but make sure we have this many.
  /// [desiredMaxTickCount] automatically choose the best tick
  ///     count to produce the 'nicest' ticks but make sure we don't have more
  ///     than this many.
  BasicNumericTickProviderSpec(
      {this.zeroBound,
      this.dataIsInWholeNumbers,
      this.desiredTickCount,
      this.desiredMinTickCount,
      this.desiredMaxTickCount});

  @override
  NumericTickProvider createTickProvider(ChartContext context) {
    final provider = new NumericTickProvider();
    if (zeroBound != null) {
      provider.zeroBound = zeroBound;
    }
    if (dataIsInWholeNumbers != null) {
      provider.dataIsInWholeNumbers = dataIsInWholeNumbers;
    }

    if (desiredMinTickCount != null ||
        desiredMaxTickCount != null ||
        desiredTickCount != null) {
      provider.setTickCount(desiredMaxTickCount ?? desiredTickCount ?? 10,
          desiredMinTickCount ?? desiredTickCount ?? 2);
    }
    return provider;
  }

  @override
  bool operator ==(Object other) =>
      other is BasicNumericTickProviderSpec &&
      zeroBound == other.zeroBound &&
      dataIsInWholeNumbers == other.dataIsInWholeNumbers &&
      desiredTickCount == other.desiredTickCount &&
      desiredMinTickCount == other.desiredMinTickCount &&
      desiredMaxTickCount == other.desiredMaxTickCount;

  @override
  int get hashCode {
    int hashcode = zeroBound?.hashCode ?? 0;
    hashcode = (hashcode * 37) + dataIsInWholeNumbers?.hashCode ?? 0;
    hashcode = (hashcode * 37) + desiredTickCount?.hashCode ?? 0;
    hashcode = (hashcode * 37) + desiredMinTickCount?.hashCode ?? 0;
    hashcode = (hashcode * 37) + desiredMaxTickCount?.hashCode ?? 0;
    return hashCode;
  }
}

/// [TickProviderSpec] that allows you to specific the ticks to be used.
@immutable
class StaticNumericTickProviderSpec implements NumericTickProviderSpec {
  final List<TickSpec<num>> tickSpecs;

  StaticNumericTickProviderSpec(this.tickSpecs);

  @override
  StaticTickProvider<num, NumericExtents, NumericScale> createTickProvider(
          ChartContext context) =>
      new StaticTickProvider<num, NumericExtents, NumericScale>(tickSpecs);

  @override
  bool operator ==(Object other) =>
      other is StaticNumericTickProviderSpec && tickSpecs == other.tickSpecs;

  @override
  int get hashCode => tickSpecs.hashCode;
}

@immutable
class BasicNumericTickFormatterSpec implements NumericTickFormatterSpec {
  final NumberFormat numberFormat;

  /// Simple [TickFormatterSpec] that delegates formatting to the given
  /// [NumberFormat].
  BasicNumericTickFormatterSpec(this.numberFormat);

  @override
  NumericTickFormatter createTickFormatter(ChartContext context) =>
      new NumericTickFormatter(numberFormat: numberFormat);

  @override
  bool operator ==(Object other) {
    return other is BasicNumericTickFormatterSpec &&
        numberFormat == other.numberFormat;
  }

  @override
  int get hashCode => numberFormat.hashCode;
}
