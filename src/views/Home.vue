<template>
  <div>
    <table border="1">
      <tr>
        <td
          class="header"
        >
          キー
        </td>
        <td
          v-for="(item0, index0) in ['1','2m','3m','4','5','6m','7m-5']"
          :key="index0"
          class="header"
        >
          {{ item0 }}
        </td>
        <td
          class="header"
        >
          合計
        </td>
      </tr>
      <tr
        v-for="(key, keyIndex) in scaleList"
        :key="keyIndex"
      >
        <td
          :class="key.without ? 'without' : 'header'"
          @click="clickWithout(key)"
        >
          {{ key.key }}
        </td>
        <td
          v-for="(scale, scaleIndex) in majorScala(key.key)"
          :key="scaleIndex"
          @click="clickSelect(scale)"
          :class="key.without ? 'without' : ''"
        >
          <span
            :class="scale.selected && !key.without ? 'selected' : ''">
            {{ scale.key }}
          </span>
        </td>
        <td
          :class="key.without ? 'without' : ''"
        >
          {{
            majorScala(key.key).map(
              (el) => el.selected ? 1 : 0
            ).reduce(
              (accumulator, currentValue) => accumulator + currentValue
            )
          }}
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: 'Home',
  data() {
    return {
      scaleList: [
        { key: 'C', without: false, selected: false },
        { key: 'C#/Db', without: false, selected: false },
        { key: 'D', without: false, selected: false },
        { key: 'D#/Eb', without: false, selected: false },
        { key: 'E', without: false, selected: false },
        { key: 'F', without: false, selected: false },
        { key: 'F#/Gb', without: false, selected: false },
        { key: 'G', without: false, selected: false },
        { key: 'G#/Ab', without: false, selected: false },
        { key: 'A', without: false, selected: false },
        { key: 'A#/Bb', without: false, selected: false },
        { key: 'B', without: false, selected: false },
      ],
    };
  },
  // async mounted() {
  //   console.dir(this.majorScala('E'));
  // },
  methods: {
    majorScala(key) {
      const startIndex = this.scaleList.findIndex((el) => el.key === key);
      return [
        this.scaleList[startIndex],
        this.scaleList[(startIndex + 2) % 12],
        this.scaleList[(startIndex + 4) % 12],
        this.scaleList[(startIndex + 5) % 12],
        this.scaleList[(startIndex + 7) % 12],
        this.scaleList[(startIndex + 9) % 12],
        this.scaleList[(startIndex + 11) % 12],
      ];
    },
    clickSelect(scale) {
      // eslint-disable-next-line no-param-reassign
      scale.selected = !scale.selected;
    },
    clickWithout(scale) {
      // eslint-disable-next-line no-param-reassign
      scale.without = !scale.without;
    },
  },
};
</script>

<style>

ul {
list-style:none;
}

li.first {
border: 1px solid #ccc;
width: 200px;
}

li.next {
width: 200px;
border-left: 1px solid #ccc;
border-right: 1px solid #ccc;
border-bottom: 1px solid #ccc;
}

span.danFirst {
float: left;
padding: 10px;
}

span.danNext {
display: block;
margin-left: 110px;
padding: 10px;
border-left: 1px solid #ccc;
}

.selected {
  color: red;
}
.without {
  background-color: black;
}
.header {
  background-color: #ee9f9f
}
</style>
