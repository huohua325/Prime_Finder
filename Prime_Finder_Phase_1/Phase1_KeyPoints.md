# 阶段1满分要点总结

## 🎯 核心评分标准

阶段1总分：**4分**（占模块总成绩4%）

---

## ⚠️ 必须严格遵守的规则

### 1. 模块结构要求
- [ ] **必须包含全部6个模块**，不多不少
- [ ] **模块命名必须正确**：And_2bit, Full_adder, Multiplier_4bit, RipSub_4bit, LongDivision_4bit, Prime_Finder
- [ ] **层级关系必须正确**：
  ```
  Prime_Finder (顶层)
  └── LongDivision_4bit
      ├── Multiplier_4bit
      │   ├── And_2bit
      │   └── Full_adder
      └── RipSub_4bit
  ```

### 2. 硬件实现约束（最易扣分！）

| 模块 | 必须使用的构建方式 | ❌ 禁止 |
|------|-------------------|---------|
| And_2bit | AND逻辑门 | 使用其他门 |
| Full_adder | AND + OR + XOR 门（按讲座方式） | 使用 + 运算符 |
| Multiplier_4bit | Full_adder + AND门（讲座第24页方式） | 使用 * 运算符 |
| RipSub_4bit | AND + OR + XOR + NOT 门 | 使用 - 运算符 |
| LongDivision_4bit | 长除法原理 + process + if语句 | 使用 / 或 mod 运算符 |

### 3. 库使用限制（严格！）

```vhdl
-- 模块1-4 只能用：
library IEEE;
use IEEE.std_logic_1164.all;

-- 模块5-6 可以额外使用（仅用于计数器增减！）：
use IEEE.std_logic_unsigned.all;
```

**⚠️ 模块5-6中 + 和 - 运算符仅限用于**：
- 计数器递增（counter + 1）
- 计数器递减（counter - 1）
- **禁止用于实际的加减运算逻辑！**

**❌ 绝对禁止在模块1-4中使用**：
- `std_logic_arith`
- `std_logic_unsigned`
- `numeric_std`（用于算术运算）
- 任何 +、-、*、/ 运算符

### 4. 时钟和Load信号
- [ ] **LongDivision_4bit 必须有 CLK 和 Load 信号**
- [ ] **Prime_Finder 必须有 CLK 和 Load 信号**
- [ ] 使用时序逻辑（process语句 + 时钟边沿检测）
- [ ] Load信号用于加载新的输入数据

### 5. 模块化方法要求
- [ ] **Multiplier_4bit 必须采用模块化方法**（参考讲座 EBU6335-24_04-VHDL_CircuitModel）
- [ ] 使用 `component` 声明和 `port map` 实例化子模块
- [ ] 不能在一个模块中直接写所有逻辑

### 6. 文件命名规范
- [ ] 顶层文件：`Prime_Finder_GroupX.vhd`（X=组号）
- [ ] 所有子文件必须包含 `_GroupX` 后缀
- [ ] 例如：`Full_adder_Group10.vhd`

---

## 📋 输入输出规范检查清单

### 顶层接口（Prime_Finder）
```vhdl
entity Prime_Finder_GroupX is
    port(
        Dividend  : in  std_logic_vector(3 downto 0);  -- 4位被除数
        Divisor   : in  std_logic_vector(3 downto 0);  -- 4位除数
        Load      : in  std_logic;                      -- 加载信号
        CLK       : in  std_logic;                      -- 时钟信号
        Q_out     : out std_logic_vector(3 downto 0);  -- 4位商
        R_out     : out std_logic_vector(3 downto 0);  -- 4位余数
        Is_Prime  : out std_logic                       -- 质数标志
    );
end entity;
```

### DE10-Lite 引脚映射
| 信号 | 引脚 | 注意事项 |
|------|------|----------|
| Dividend | SW7-SW4 | SW7=MSB |
| Divisor | SW3-SW0 | SW3=MSB |
| Load | SW9 | - |
| CLK | MAX10_CLK1_50 | 50MHz时钟 |
| Q_out | HEX0+HEX1 | **必须十进制显示！** |
| R_out | HEX4+HEX5 | **必须十进制显示！** |
| Is_Prime | LED9 | 1=质数 |

---

## 🔍 测试要求

### ModelSim仿真
- [ ] **每个模块必须单独测试**
- [ ] 编写testbench文件
- [ ] 波形必须清晰展示功能正确性

### 板级演示
- [ ] 代码成功下载到DE10-Lite
- [ ] 现场演示系统正常工作
- [ ] 七段显示器正确显示十进制结果

### 视频证据
- [ ] 清晰展示代码
- [ ] 展示ModelSim波形结果
- [ ] 演示开发板实际运行

---

## 🚫 常见扣分点

1. **使用 +、-、*、/ 运算符代替逻辑门实现**（模块1-4）
2. **模块层级关系错误**
3. **缺少CLK或Load信号**（模块5-6）
4. **使用了禁止的库**
5. **七段显示器显示十六进制而非十进制**
6. **文件命名不含组号后缀**
7. **提交时未删除调试用的额外输出**
8. **模块接口不兼容导致系统无法整合**
9. **Multiplier_4bit未使用模块化方法**（直接写逻辑而非实例化子模块）
10. **LongDivision_4bit未使用process+if语句结构**
11. **模块数量不对**（必须恰好6个，不能多也不能少）

---

## ✅ 提交前最终检查

### 代码检查
- [ ] 所有6个模块完整且命名正确
- [ ] 模块层级关系正确
- [ ] 库使用符合规定
- [ ] CLK和Load信号存在于模块5和6
- [ ] 文件命名包含组号（如 `_Group10`）
- [ ] Multiplier_4bit使用component和port map
- [ ] LongDivision_4bit使用process+if结构
- [ ] 删除所有调试用的额外输出（如Dividend_out、Divider_out）

### 测试检查
- [ ] 每个模块有独立testbench
- [ ] 每个模块有ModelSim波形截图
- [ ] 全部输入0-15测试通过

### 板级检查
- [ ] 七段显示器输出为十进制（非十六进制）
- [ ] 代码可成功编译并下载到DE10-Lite
- [ ] SW拨码开关控制正确
- [ ] LED9正确显示质数状态

### 视频检查
- [ ] 视频清晰展示每个模块代码
- [ ] 视频展示ModelSim波形结果
- [ ] 视频包含DE10-Lite板级演示
