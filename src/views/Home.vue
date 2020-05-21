<template>
  <div>
    <div>
      <h2>メジャー</h2>
      <table border="1">
        <tr>
          <td
            class="header"
          >
            キー/ダイアトニック(triad/tetrad)
          </td>
          <td
            v-for="(item0, index0) in diatonic('major')"
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
          v-for="(key, keyIndex) in major.scaleList"
          :key="keyIndex"
        >
          <td
            :class="key.without ? 'without' : 'header'"
            @click="clickWithout(key)"
          >
            {{ key.key }}
          </td>
          <td
            v-for="(scale, scaleIndex) in getScale('major', key.key)"
            :key="scaleIndex"
            :class="key.without ? 'without' : ''"
            @click="clickSelect(scale)"
          >
            <span
              :class="scale.selected && !key.without ? 'selected' : ''"
            >
              {{ scale.key }}
            </span>
          </td>
          <td
            :class="key.without ? 'without' : ''"
          >
            {{
              getScale('major', key.key).map(
                (el) => el.selected ? 1 : 0
              ).reduce(
                (accumulator, currentValue) => accumulator + currentValue
              )
            }}
          </td>
        </tr>
      </table>
    </div>
    <div>
      <h2>ナチュラルマイナー</h2>
      <table border="1">
        <tr>
          <td
            class="header"
          >
            キー/ダイアトニック(triad/tetrad)
          </td>
          <td
            v-for="(item0, index0) in diatonic('naturalMinor')"
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
          v-for="(key, keyIndex) in naturalMinor.scaleList"
          :key="keyIndex"
        >
          <td
            :class="key.without ? 'without' : 'header'"
            @click="clickWithout(key)"
          >
            {{ key.key }}
          </td>
          <td
            v-for="(scale, scaleIndex) in getScale('naturalMinor', key.key)"
            :key="scaleIndex"
            :class="key.without ? 'without' : ''"
            @click="clickSelect(scale)"
          >
            <span
              :class="scale.selected && !key.without ? 'selected' : ''"
            >
              {{ scale.key }}
            </span>
          </td>
          <td
            :class="key.without ? 'without' : ''"
          >
            {{
              getScale('naturalMinor', key.key).map(
                (el) => el.selected ? 1 : 0
              ).reduce(
                (accumulator, currentValue) => accumulator + currentValue
              )
            }}
          </td>
        </tr>
      </table>
    </div>
    <div>
      <h2>ハーモニックマイナー</h2>
      <table border="1">
        <tr>
          <td
            class="header"
          >
            キー/ダイアトニック(triad/tetrad)
          </td>
          <td
            v-for="(item0, index0) in diatonic('harmonicMinor')"
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
          v-for="(key, keyIndex) in harmonicMinor.scaleList"
          :key="keyIndex"
        >
          <td
            :class="key.without ? 'without' : 'header'"
            @click="clickWithout(key)"
          >
            {{ key.key }}
          </td>
          <td
            v-for="(scale, scaleIndex) in getScale('harmonicMinor', key.key)"
            :key="scaleIndex"
            :class="key.without ? 'without' : ''"
            @click="clickSelect(scale)"
          >
            <span
              :class="scale.selected && !key.without ? 'selected' : ''"
            >
              {{ scale.key }}
            </span>
          </td>
          <td
            :class="key.without ? 'without' : ''"
          >
            {{
              getScale('harmonicMinor', key.key).map(
                (el) => el.selected ? 1 : 0
              ).reduce(
                (accumulator, currentValue) => accumulator + currentValue
              )
            }}
          </td>
        </tr>
      </table>
    </div>
    <div>
      <h2>メロディックマイナー</h2>
      <table border="1">
        <tr>
          <td
            class="header"
          >
            キー/ダイアトニック(triad/tetrad)
          </td>
          <td
            v-for="(item0, index0) in diatonic('melodicMinor')"
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
          v-for="(key, keyIndex) in melodicMinor.scaleList"
          :key="keyIndex"
        >
          <td
            :class="key.without ? 'without' : 'header'"
            @click="clickWithout(key)"
          >
            {{ key.key }}
          </td>
          <td
            v-for="(scale, scaleIndex) in getScale('melodicMinor', key.key)"
            :key="scaleIndex"
            :class="key.without ? 'without' : ''"
            @click="clickSelect(scale)"
          >
            <span
              :class="scale.selected && !key.without ? 'selected' : ''"
            >
              {{ scale.key }}
            </span>
          </td>
          <td
            :class="key.without ? 'without' : ''"
          >
            {{
              getScale('melodicMinor', key.key).map(
                (el) => el.selected ? 1 : 0
              ).reduce(
                (accumulator, currentValue) => accumulator + currentValue
              )
            }}
          </td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Home',
  data() {
    return {
      major: {
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
      },
      naturalMinor: {
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
      },
      harmonicMinor: {
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
      },
      melodicMinor: {
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
      },
    };
  },
  methods: {
    diatonic(type) {
      switch (type) {
        case 'major':
          return ['(T) Ⅰ / ⅠM7', 'Ⅱm / Ⅱm7', 'Ⅲm / Ⅲm7', '(SD) Ⅳ / ⅣM7', '(D) Ⅴ / Ⅴ7', 'Ⅵm / Ⅵm7', 'Ⅶm-5 / Ⅶm7-5'];
        case 'naturalMinor':
          return ['(T) Ⅰm / Ⅰm7', 'Ⅱm-5 / Ⅱm7-5', 'Ⅲ / ⅢM7', '(SD) Ⅳm / Ⅳm7', '(D) Ⅴm / Ⅴm7', 'Ⅵ / ⅥM7', 'Ⅶ / Ⅶ7'];
        case 'harmonicMinor':
          return ['(T) Ⅰm / ⅠmM7', 'Ⅱm-5 / Ⅱm7-5', 'Ⅲ+5 / ⅢM7+5', '(SD) Ⅳm / Ⅳm7', '(D) Ⅴ / Ⅴ7', 'Ⅵ / ⅥM7', '(L) Ⅶm-5 / Ⅶdim7'];
        case 'melodicMinor':
          return ['(T) Ⅰm / ⅠmM7', 'Ⅱm / Ⅱm7', 'Ⅲ+5 / ⅢM7+5', '(SD) Ⅳ / Ⅳ7', '(D) Ⅴ / Ⅴ7', 'Ⅵm-5 / Ⅵm7-5', '(L) Ⅶm-5 / Ⅶm7-5'];
        default:
          return [];
      }
    },
    getScale(type, key) {
      const startIdx = this[type].scaleList.findIndex((el) => el.key === key);
      let scaleStep = [];

      switch (type) {
        case 'major':
          scaleStep = [0, 2, 4, 5, 7, 9, 11];
          break;
        case 'naturalMinor':
          scaleStep = [0, 2, 3, 5, 7, 8, 10];
          break;
        case 'harmonicMinor':
          scaleStep = [0, 2, 3, 5, 7, 8, 11];
          break;
        case 'melodicMinor':
          scaleStep = [0, 2, 3, 5, 7, 9, 11];
          break;
        default:
          scaleStep = [];
          break;
      }

      return scaleStep.map((el) => this[type].scaleList[(startIdx + el) % 12]);
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
