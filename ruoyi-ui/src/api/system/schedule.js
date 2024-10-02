import request from '@/utils/request'

// 查询排班信息列表
export function listSchedule(query) {
  return request({
    url: '/system/schedule/list',
    method: 'get',
    params: query
  })
}

// 查询排班信息详细
export function getSchedule(id) {
  return request({
    url: '/system/schedule/' + id,
    method: 'get'
  })
}

// 新增排班信息
export function addSchedule(data) {
  return request({
    url: '/system/schedule',
    method: 'post',
    data: data
  })
}


// 修改排班信息
export function updateSchedule(data) {
  return request({
    url: '/system/schedule',
    method: 'put',
    data: data
  })
}

// 删除排班信息
export function delSchedule(id) {
  return request({
    url: '/system/schedule/' + id,
    method: 'delete'
  })
}
