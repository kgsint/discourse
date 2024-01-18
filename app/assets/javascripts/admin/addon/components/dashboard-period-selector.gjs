import Component from "@glimmer/component";
import { action } from "@ember/object";
import { inject as service } from "@ember/service";
import DButton from "discourse/components/d-button";
import PeriodChooser from "select-kit/components/period-chooser";
import CustomDateRangeModal from "../components/modal/custom-date-range";

export default class DashboardPeriodSelector extends Component {
  @service modal;

  availablePeriods = ["yearly", "quarterly", "monthly", "weekly"];

  @action
  openCustomDateRangeModal() {
    this.modal.show(CustomDateRangeModal, {
      model: {
        startDate: this.args.startDate,
        endDate: this.args.endDate,
        setCustomDateRange: this.args.setCustomDateRange,
      },
    });
  }

  <template>
    <div>
      <PeriodChooser
        @period={{@period}}
        @action={{@setPeriod}}
        @content={{this.availablePeriods}}
        @fullDay={{false}}
      />
      <DButton
        @icon="cog"
        @action={{this.openCustomDateRangeModal}}
        @title="admin.dashboard.custom_date_range"
        class="custom-date-range-button"
      />
    </div>
  </template>
}
