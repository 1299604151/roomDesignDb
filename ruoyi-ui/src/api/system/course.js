import request from '@/utils/request'

// 查询课程信息列表
export function listCourse(query) {
  return request({
    url: '/system/course/list',
    method: 'get',
    params: query
  })
}

// 查询课程信息详细
export function getCourse(id) {
  return request({
    url: '/system/course/' + id,
    method: 'get'
  })
}


// 选课
export function selectCourse(id) {
  return request({
    url: '/system/course/select/' + id,
    method: 'get'
  })
}
// 获取自己选择的课程
export function myCourse(id) {
  return request({
    url: '/system/course/myCourse',
    method: 'get'
  })
}
// 获取课程数和学员数
export function courseAndStudentCount(id) {
  return request({
    url: '/system/course/courseAndStudentCount',
    method: 'get'
  })
}

// 新增课程信息
export function addCourse(data) {
  return request({
    url: '/system/course',
    method: 'post',
    data: data
  })
}

// 修改课程信息
export function updateCourse(data) {
  return request({
    url: '/system/course',
    method: 'put',
    data: data
  })
}

// 删除课程信息
export function delCourse(id) {
  return request({
    url: '/system/course/' + id,
    method: 'delete'
  })
}



