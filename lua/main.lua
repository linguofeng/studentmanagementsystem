local welcome           -- 欢迎界面
local student_list      -- 学生列表
local main              -- 主函数

local function menu(t)
    t.choose = function(self, x)
        local func = self[x]
        if func then
            if type(func) == 'function' then
                return func()
            else
                error("case " .. tostring(x) .. " not a function")
            end
        end
    end
    return t
end

function welcome()
    print('--***********************************--')
    print('欢迎使用学生管理系统!!')
    print('--***********************************--')
    print('  请输入指令：')
    print('    1、学生列表')
    print('    2、查找学生')
    print('    3、学生管理')
    print('    4、退出系统')
    print('\n--***********************************--')
    
    local mainMenu = menu {
        [1] = student_list,
        [2] = function() print('菜单2') end,
        [3] = function() print('菜单3') end,
        [4] = function()
            print('谢谢使用!')
            os.exit()
        end
    }

    return mainMenu
end

function student_list()
    print('--***********************************--')
    print('学生列表!!')
    print('--***********************************--')
    print('  请输入指令：')
    print('    1、学生列表')
    print('    2、查找学生')
    print('    3、学生管理')
    print('    4、返回')
    print('\n--***********************************--')
    
    local mainMenu = menu {
        [1] = function() print('菜单11') end,
        [2] = function() print('菜单12') end,
        [3] = function() print('菜单13') end,
        [4] = welcome
    }

    return mainMenu
end


-- 主函数
local function main()
    local mainMenu = welcome()

    while true do
        local read = io.read('*number')

        -- 清空
        os.execute('clear')
        if read then
            local m = mainMenu:choose(read)
            if m then
                mainMenu = m
            end
        else
            print('请重新输入')
        end
    end
end

main()
